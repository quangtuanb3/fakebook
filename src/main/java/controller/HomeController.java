package controller;

import DAO.UserDAO;
import Model.Enum.EGender;
import Model.Enum.ELimit;
import Model.Profile;
import Model.User;
import Utils.AppConstant;
import Utils.AppUtil;
import Utils.RunnableCustom;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.cj.Session;
import services.PostService;
import services.ProfileService;
import services.UserService;
import services.dto.Enum.ESortType;
import services.dto.PageableRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@WebServlet(urlPatterns = "/users/home", name = "profileController")
public class HomeController extends HttpServlet {
    private final String PAGE = "/users";

    private Map<String, RunnableCustom> validators;

    private final Map<String, String> errors = new HashMap<>();
    UserDAO userDAO = new UserDAO();

    @Override
    public void init() {
        validators = new HashMap<>();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter(AppConstant.ACTION);
        showList(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        errors.clear();
        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter(AppConstant.ACTION); // lấy action
        if (Objects.equals(action, AppConstant.CREATE)) {
            //kiểm tra xem action = create thi call create
            create(req, resp);
            return;
        }
        if (Objects.equals(action, AppConstant.EDIT)) {
            //kiểm tra xem action = create thi call edit
            edit(req, resp);
            return;
        }
        showList(req, resp);
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        User user = getValidUser(req, resp);
        Profile profile = getValidProfile(req, resp);
        if (errors.size() == 0) {
            UserService.getUserService().create(user);
            var userDB = userDAO.getUserByEmail(user.getEmail());
            profile.setUser(userDB);
            ProfileService.getProfileService().create(profile);
            resp.sendRedirect("/admins/users-management?message=Created");
        }
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Profile profile = getValidProfile(req, resp); // lấy ra user và + xử lý cho việc validation của các field trong class User.
        if (errors.size() == 0) { //không xảy lỗi (errors size == 0) thì mình mới sửa user.
            ProfileService.getProfileService().edit(profile);
            resp.sendRedirect("/admins/users-management?message=Edited");
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //page, Integer totalOfPage, Integer limit, Integer totalPage
        PageableRequest request = new PageableRequest(
                req.getParameter("search"),
                "time",
                ESortType.valueOf(AppUtil.getParameterWithDefaultValue(req, "sortType", ESortType.DESC).toString()),
                Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "page", "1").toString()),
                Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "limit", "10").toString())
        ); //tao doi tuong pageable voi parametter search
        var session =  req.getSession();
        User user = (User) session.getAttribute("user");
        Profile profile = ProfileService.getProfileService().findProfileByEmail(user.getEmail());
        request.setProfile(profile);
        req.setAttribute("pageable", request);
        req.setAttribute("profile",profile);
        req.setAttribute("matchesPosts", PostService.getPostService().getMatchesPost(request)); // gửi qua list users để jsp vẻ lên trang web
//        req.setAttribute("message", req.getParameter("message")); // gửi qua message để toastr show thông báo
        req.setAttribute("postLimitJSON", AppUtil.mapper.writeValueAsString(ELimit.values()));
        req.getRequestDispatcher(AppConstant.USERS_PAGE).forward(req, resp);

        // Handle or log the exception


    }


    private Profile getValidProfile(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Profile profile = (Profile) AppUtil.getObjectWithValidation(req, Profile.class, validators); //
        if (errors.size() > 0) {
            PageableRequest request = new PageableRequest(
                    req.getParameter("search"),
                    req.getParameter("sortField"),
                    ESortType.valueOf(AppUtil.getParameterWithDefaultValue(req, "sortType", ESortType.DESC).toString()),
                    Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "page", "1").toString()),
                    Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "limit", "10").toString())
            );
            req.setAttribute("pageable", request);
            req.setAttribute("profiles", ProfileService.getProfileService().getProfileList(request)); // gửi qua list users để jsp vẻ lên trang web
            req.setAttribute("profilesJSON", new ObjectMapper().writeValueAsString(ProfileService.getProfileService().getProfileList(request)));
            req.setAttribute("gendersJSON", new ObjectMapper().writeValueAsString(EGender.values()));
            req.setAttribute("usersJSON", new ObjectMapper().writeValueAsString(UserService.getUsers(request)));
            req.setAttribute("message", "Something was wrong");
            req.getRequestDispatcher(PAGE + AppConstant.USERS_MANAGEMENT_PAGE)
                    .forward(req, resp);
        }

        return profile;
    }

    private User getValidUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        User user = (User) AppUtil.getObjectWithValidation(req, User.class, validators);
        assert user != null;
        user.setPassword(UUID.randomUUID().toString());
        if (errors.size() > 0) {
            PageableRequest request = new PageableRequest(
                    req.getParameter("search"),
                    req.getParameter("sortField"),
                    ESortType.valueOf(AppUtil.getParameterWithDefaultValue(req, "sortType", ESortType.DESC).toString()),
                    Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "page", "1").toString()),
                    Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "limit", "10").toString())
            );
            req.setAttribute("message", "Something was wrong");
            req.getRequestDispatcher(PAGE + AppConstant.USERS_MANAGEMENT_PAGE)
                    .forward(req, resp);
        }
        return user;
    }

    private boolean checkIdNotFound(HttpServletRequest req, HttpServletResponse resp, Integer id) throws IOException {
        if (!ProfileService.getProfileService().existById(id)) {
            resp.sendRedirect(PAGE + "?message=Id not found");
            return true;
        }
        return false;
    }
}
