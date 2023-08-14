package controller;

import DAO.UserDAO;
import Model.Enum.ERole;
import Model.Enum.EStatus;
import Model.Profile;
import Model.User;
import Utils.AppConstant;
import Utils.AppUtil;
import Utils.RunnableCustom;
import Utils.RunnableWithRegex;
import com.fasterxml.jackson.databind.ObjectMapper;

import services.ProfileService;
import services.UserService;
import Model.Enum.EGender;
import services.dto.Enum.ESortType;
import services.dto.PageableRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet(urlPatterns = "/admins/users-management", name = "profileManagerController")
public class ProfileManagerController extends HttpServlet {
    private final String PAGE = "/admins";

    private Map<String, RunnableCustom> validators;

    private final Map<String, String> errors = new HashMap<>();
    UserDAO userDAO=new UserDAO();

    @Override
    public void init() {
        validators = new HashMap<>();
        validators.put("phone", new RunnableWithRegex("0[0-9]{9}", "phone", errors));
        validators.put("name", new RunnableWithRegex("^[A-Za-z ]{6,20}", "name", errors));
        validators.put("gender", new RunnableWithRegex("^(MALE|FEMALE|OTHER)$", "gender", errors));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter(AppConstant.ACTION);
        if (Objects.equals(action, AppConstant.LOCK)) {
            //kiểm tra xem action = create thi call edit
            lock(req, resp);
            return;
        }
        showList(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        errors.clear(); // clear lỗi cũ
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
        }if (Objects.equals(action, AppConstant.LOCK)) {
            //kiểm tra xem action = create thi call edit
            lock(req, resp);
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
    private void lock(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        if(checkIdUserNotFound(req, resp, id)) return;
        UserService.getUserService().lock(id);
        resp.sendRedirect( "/admins/users-management?message=Set status successfully");
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
                req.getParameter("sortField"),
                ESortType.valueOf(AppUtil.getParameterWithDefaultValue(req,"sortType", ESortType.ASC).toString()),
                Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "page", "1").toString()),
                Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "limit", "10").toString())
        ); //tao doi tuong pageable voi parametter search

        req.setAttribute("pageable", request);
        req.setAttribute("profiles", ProfileService.getProfileService().getProfileList(request)); // gửi qua list users để jsp vẻ lên trang web
        req.setAttribute("profilesJSON", AppUtil.mapper.writeValueAsString(ProfileService.getProfileService().getProfileList(request)));
        req.setAttribute("message", req.getParameter("message")); // gửi qua message để toastr show thông báo
        req.setAttribute("gendersJSON",AppUtil.mapper.writeValueAsString(EGender.values()));
        req.setAttribute("statusJSON",AppUtil.mapper.writeValueAsString(EStatus.values()));
        req.setAttribute("rolesJSON",AppUtil.mapper.writeValueAsString(ERole.values()));
        req.setAttribute("usersJSON", AppUtil.mapper.writeValueAsString(UserService.getUsers(request)));
        String s = PAGE + AppConstant.USERS_MANAGEMENT_PAGE;
        System.out.println("url" + s);
        req.getRequestDispatcher(s).forward(req,resp);
    }

    private Profile getValidProfile(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Profile profile = (Profile) AppUtil.getObjectWithValidation(req, Profile.class,  validators); //
        if(errors.size() > 0){
            PageableRequest request = new PageableRequest(
                    req.getParameter("search"),
                    req.getParameter("sortField"),
                    ESortType.valueOf(AppUtil.getParameterWithDefaultValue(req,"sortType", ESortType.DESC).toString()),
                    Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "page", "1").toString()),
                    Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "limit", "10").toString())
            );
            req.setAttribute("pageable", request);
            req.setAttribute("profiles", ProfileService.getProfileService().getProfileList(request)); // gửi qua list users để jsp vẻ lên trang web
            req.setAttribute("profilesJSON", new ObjectMapper().writeValueAsString(ProfileService.getProfileService().getProfileList(request)));
            req.setAttribute("gendersJSON", new ObjectMapper().writeValueAsString(EGender.values()));
            req.setAttribute("rolesJSON",AppUtil.mapper.writeValueAsString(ERole.values()));

            req.setAttribute("usersJSON", new ObjectMapper().writeValueAsString(UserService.getUsers(request)));
            req.setAttribute("message","Something was wrong");
            req.getRequestDispatcher(PAGE + AppConstant.USERS_MANAGEMENT_PAGE)
                    .forward(req,resp);
        }

        return profile;
    }

    private User getValidUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        User user = (User) AppUtil.getObjectWithValidation(req, User.class,  validators);
        assert user != null;
        user.setRole(ERole.USER);
        user.setStatus(EStatus.ACTIVE);
        user.setPassword(UUID.randomUUID().toString());
        if(errors.size() > 0){
            PageableRequest request = new PageableRequest(
                    req.getParameter("search"),
                    req.getParameter("sortField"),
                    ESortType.valueOf(AppUtil.getParameterWithDefaultValue(req,"sortType", ESortType.DESC).toString()),
                    Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "page", "1").toString()),
                    Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "limit", "10").toString())
            );
            req.setAttribute("pageable", request);
            req.setAttribute("profiles", ProfileService.getProfileService().getProfileList(request));
            req.setAttribute("usersJSON", new ObjectMapper().writeValueAsString(UserService.getUsers(request)));
            req.setAttribute("message","Something was wrong");
            req.getRequestDispatcher(PAGE + AppConstant.USERS_MANAGEMENT_PAGE)
                    .forward(req,resp);
        }
        return user;
    }

    private boolean checkIdNotFound(HttpServletRequest req, HttpServletResponse resp, Integer id) throws IOException{
        if(!ProfileService.getProfileService().existById(id)){
            resp.sendRedirect(PAGE + "/users-management" + "?message=Id not found");
            return true;
        }
        return false;
    }
    private boolean checkIdUserNotFound(HttpServletRequest req, HttpServletResponse resp, Integer id) throws IOException{
        if(!UserService.getUserService().existById(id)){
            resp.sendRedirect(PAGE+ "/users-management" + "?message=Id not found");
            return true;
        }
        return false;
    }
}
