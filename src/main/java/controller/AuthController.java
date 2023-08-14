package controller;


import Model.Enum.EGender;
import Model.Profile;
import Model.User;
import Utils.AppUtil;
import services.AuthService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Objects;

@WebServlet(urlPatterns = "/auths", name = "authController")
public class AuthController extends HttpServlet {
    private final AuthService authService = new AuthService();

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
        User user = (User) AppUtil.getObjectWithValidation(req, User.class, new HashMap<>());
        Profile profile = (Profile) AppUtil.getObjectWithValidation(req, Profile.class, new HashMap<>());
        assert user != null;
        assert profile != null;
        authService.register(user, profile);
        req.setAttribute("message", "Register successfully");
        req.getRequestDispatcher("auths/login.jsp").forward(req, resp);
    }

    private void login(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            User user = (User) AppUtil.getObjectWithValidation(req, User.class, new HashMap<>());
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