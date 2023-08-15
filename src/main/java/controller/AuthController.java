package controller;


import Model.Enum.EGender;
import Model.Profile;
import Model.User;
import Utils.AppUtil;
import Utils.RunnableCustom;
import Utils.RunnableWithRegex;
import services.AuthService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

import static Utils.AppUtil.getObjectWithValidation;

@WebServlet(urlPatterns = "/auths", name = "authController")
public class AuthController extends HttpServlet {
    private final AuthService authService = new AuthService();
    private Map<String, RunnableCustom> validators;

    private final Map<String, String> errors = new HashMap<>();

    @Override
    public void init() {
        validators = new HashMap<>();
        validators.put("dob", new RunnableWithRegex("^(1970-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])|20[01][0-9]-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])|2023-(0[1-5])-([01][0-9]|2[0-3]))$", "dob", errors));
        validators.put("name", new RunnableWithRegex("^[A-Za-z ]{6,20}", "name", errors));
        validators.put("gender", new RunnableWithRegex("^(MALE|FEMALE|OTHER)$", "gender", errors));
        validators.put("email", new RunnableWithRegex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$\n", "email", errors));
        validators.put("password", new RunnableWithRegex("^.{6,20}$", "password", errors));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String page = "auths/login.jsp";
        if (Objects.equals(action, "403")) {
            page = "auths/page-403.jsp";
        }
        if (Objects.equals(action, "logout")) {
            req.getSession().removeAttribute("login");
        }
        req.setAttribute("message", req.getParameter("message"));
        req.setAttribute("gendersJSON", AppUtil.mapper.writeValueAsString(EGender.values()));
        req.getRequestDispatcher(page).forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (Objects.equals(action, "login")) {
            login(req, resp);
            return;
        }
        if (Objects.equals(action, "register")) {
            register(req, resp);
            return;
        }
        req.getRequestDispatcher("auths/login.jsp").forward(req, resp);
    }

    private void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) AppUtil.getObjectWithValidation(req, User.class, validators);
        Profile profile = (Profile) AppUtil.getObjectWithValidation(req, Profile.class, validators);
        assert user != null;
        assert profile != null;
        authService.register(user, profile);
        req.setAttribute("message", "Register successfully");
        req.getRequestDispatcher("auths/login.jsp").forward(req, resp);
    }

    private Profile getObjectWithValidationPass(HttpServletRequest req) {
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String avatar = req.getParameter("avatar");
        Date dob = Date.valueOf(req.getParameter("dob"));
        EGender gender = EGender.valueOf(req.getParameter("gender"));
        String cover = req.getParameter("cover");
      Profile profile = new Profile();
      profile.setName(name);
      profile.setPhone(phone);
      profile.setName(avatar);
      profile.setDob(dob);
      profile.setGender(gender);
      profile.setCover(cover);
      return profile;
    }

    private User getUserWithValidationUser(HttpServletRequest req) {
//        Integer id =Integer.valueOf(req.getParameter("id"));
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        return new User(email, password);
    }

    private void login(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            User user = (User) getObjectWithValidation(req, User.class, new HashMap<>());
            assert user != null;
            String destinationPage = authService.login(user, req);
            resp.sendRedirect(destinationPage);
        } catch (RuntimeException exception) {
            req.setAttribute("message", exception.getMessage());
            req.setAttribute("gendersJSON", AppUtil.mapper.writeValueAsString(EGender.values()));
            req.getRequestDispatcher("auths/login.jsp").forward(req, resp);
        }
    }

}