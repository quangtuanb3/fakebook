package controller;

import DAO.UserDAO;
import Model.Enum.EGender;
import Model.Enum.ELimit;
import Model.Post;
import Model.Profile;
import Model.User;
import Utils.AppConstant;
import Utils.AppUtil;
import Utils.RunnableCustom;
import Utils.RunnableWithRegex;
import com.fasterxml.jackson.databind.ObjectMapper;
import services.PostService;
import services.ProfileService;
import services.UploadService;
import services.UserService;
import services.dto.Enum.ESortType;
import services.dto.PageableRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.*;

import static Utils.AppUtil.formatPostTime;
import static Utils.AppUtil.mapper;
import static controller.UploadImageController.IMAGE_SAVE_DIRECTORY;
import static controller.UploadImageController.IMAGE_SAVE_SERVER;

@WebServlet(urlPatterns = "/users/profile", name = "profileUserController")


public class ProfileUserController extends HttpServlet {
    private final String PAGE = "/users";

    private Map<String, RunnableCustom> validators;

    private final Map<String, String> errors = new HashMap<>();
    UserDAO userDAO = new UserDAO();

    @Override
    public void init() {
        validators = new HashMap<>();
        validators.put("phone", new RunnableWithRegex("0[0-9]{9}", "phone", errors));
        validators.put("name", new RunnableWithRegex("^[A-Za-z ]{6,20}", "name", errors));
        validators.put("gender", new RunnableWithRegex("^(MALE|FEMALE|OTHER)$", "gender", errors));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        showList(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        errors.clear();
        req.setCharacterEncoding("UTF-8");

        //kiểm tra xem action = create thi call edit
        edit(req, resp);

    }


    private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Profile profile = getValidProfile(req, resp);
        if (errors.size() == 0) {
            ProfileService.getProfileService().edit(profile);
            resp.sendRedirect("/users/profile?message=Edited");
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
        );
        var session = req.getSession();
        User user = (User) session.getAttribute("user");
        Profile profile = ProfileService.getProfileService().findProfileByEmail(user.getEmail());
        String profilePram = req.getParameter("profileId");

        Profile searchProfile = new Profile();
        if (profilePram == null) {
            searchProfile = profile;
        } else {
            Integer profileId = Integer.parseInt(profilePram);
            searchProfile = ProfileService.getProfileService().findById(profileId);
        }
        request.setProfile(searchProfile);

        List<Post> matchesPost = PostService.getPostService().getSelfPost(request);
        for (Post post : matchesPost) {
            post.setFormattedTime(formatPostTime(post.getTime().toString()));
        }
        req.setAttribute("pageable", request);
        req.setAttribute("selfProfile", profile);
        req.setAttribute("searchProfile", searchProfile);
        req.setAttribute("selfProfileJSON", new ObjectMapper().writeValueAsString(profile));
        req.setAttribute("searchProfileJSON", new ObjectMapper().writeValueAsString(searchProfile));
        req.setAttribute("gendersJSON", new ObjectMapper().writeValueAsString(EGender.values()));
        req.setAttribute("matchesPosts",matchesPost ); // gửi qua list users để jsp vẻ lên trang web
        req.setAttribute("matchesPostsJSON",mapper.writeValueAsString(matchesPost) ); // gửi qua list users để jsp vẻ lên trang web
        req.setAttribute("postLimitJSON", AppUtil.mapper.writeValueAsString(ELimit.values()));
        req.getRequestDispatcher(AppConstant.USER_PROFILE_PAGE).forward(req, resp);

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
            var session = req.getSession();
            User user = (User) session.getAttribute("user");
            profile = ProfileService.getProfileService().findProfileByEmail(user.getEmail());
            request.setProfile(profile);
            req.setAttribute("pageable", request);
            req.setAttribute("profiles", ProfileService.getProfileService().getProfileList(request)); // gửi qua list users để jsp vẻ lên trang web
            req.setAttribute("profilesJSON", new ObjectMapper().writeValueAsString(ProfileService.getProfileService().getProfileList(request)));
            req.setAttribute("gendersJSON", new ObjectMapper().writeValueAsString(EGender.values()));
            req.setAttribute("message", "Something was wrong");
            req.getRequestDispatcher( AppConstant.USER_PROFILE_PAGE)
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


}
