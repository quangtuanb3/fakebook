

package controller;

import Model.Content;
import Model.Enum.ELimit;
import Model.Post;
import Model.Profile;

import Model.User;
import Utils.AppConstant;
import Utils.AppUtil;
import Utils.RunnableCustom;
import com.fasterxml.jackson.databind.ObjectMapper;
import services.ContentService;
import services.PostService;
import services.ProfileService;
import services.dto.PageableRequest;
import services.UserService;
import services.dto.Enum.ESortType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

@WebServlet(urlPatterns = "/admins/posts-management", name = "postManagementController")
public class PostManagementController extends HttpServlet {
    private final String PAGE = "/admins";

    private Map<String, RunnableCustom> validators;

    private final Map<String, String> errors = new HashMap<>();

    @Override
    public void init() {
        validators = new HashMap<>();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter(AppConstant.ACTION);
        if (Objects.equals(action, AppConstant.DELETE)) {
            delete(req, resp);
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
            try {
                create(req, resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return;
        }
        if (Objects.equals(action, AppConstant.EDIT)) {
            //kiểm tra xem action = create thi call edit
            try {
                edit(req, resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return;
        }
        showList(req, resp);
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
        Post post = getValidPost(req, resp); // lấy ra user và + xử lý cho việc validation của các field trong class User.
        if (errors.size() == 0) { //không xảy lỗi (errors size == 0) thì mình mới tạo user.
            PostService.getPostService().create(post);
            resp.sendRedirect("/admins/posts-management?message=Created");
        }

    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        String content = req.getParameter("data");
        String location = req.getParameter("location");
        ELimit postLimit = ELimit.valueOf(req.getParameter("post_limit"));
        int content_id = Integer.parseInt(req.getParameter("content.id"));
        Content contentDB = ContentService.getContentService().findById(content_id);
        contentDB.setData(content);
        Post postDB = PostService.getPostService().findById(id);
        postDB.setLocation(location);
        postDB.setPostLimit(postLimit);
        postDB.setContent(contentDB);
        ContentService.getContentService().update(contentDB);
        //        Post post = getValidPost(req, resp);
        if (errors.size() == 0) {
            PostService.getPostService().edit(postDB);
            resp.sendRedirect("/admins/posts-management?message=Edited");
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //page, Integer totalOfPage, Integer limit, Integer totalPage
        PageableRequest request = new PageableRequest(
                req.getParameter("search"),
                req.getParameter("sortField"),
                ESortType.valueOf(AppUtil.getParameterWithDefaultValue(req, "sortType", ESortType.DESC).toString()),
                Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "page", "1").toString()),
                Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "limit", "10").toString())
        ); //tao doi tuong pageable voi parametter search

        req.setAttribute("pageable", request);
        req.setAttribute("profiles", ProfileService.getProfileService().getProfileList(request)); // gửi qua list users để jsp vẻ lên trang web
        req.setAttribute("posts", PostService.getPostService().getPostList(request)); // gửi qua list users để jsp vẻ lên trang web
//        req.setAttribute("limitJSON", new ObjectMapper().writeValueAsString(ProfileService.getProfileService().getProfileList(request)));
        req.setAttribute("message", req.getParameter("message")); // gửi qua message để toastr show thông báo
        req.setAttribute("postsJSON", new ObjectMapper().writeValueAsString(PostService.getPostService().getPostList(request)));
        req.setAttribute("postLimitJSON", AppUtil.mapper.writeValueAsString(ELimit.values()));
//        req.setAttribute("usersJSON", AppUtil.mapper.writeValueAsString(UserService.getUsers(request)));
        req.setAttribute("contentsJSON", new ObjectMapper().writeValueAsString(ContentService.getContents()));
        String s = PAGE + AppConstant.POST_MANAGEMENT_PAGE;
        req.getRequestDispatcher(s).forward(req, resp);
    }

//    private void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setAttribute("profilesJSON", AppUtil.mapper.writeValueAsString(new Profile())); // gửi qua user rỗng để JS vẻ lên trang web
//        req.setAttribute("limitJSON", AppUtil.mapper.writeValueAsString(ELimit.values()));
////        req.setAttribute("usersJSON", new ObjectMapper().writeValueAsString(UserService.getUsers()));
//        req.getRequestDispatcher(PAGE + AppConstant.POST_MANAGEMENT_PAGE)
//                .forward(req,resp);
//    }

//    private void showEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        Integer id = Integer.valueOf(req.getParameter("id"));
//        if(checkIdNotFound(req, resp, id)) return;
//        req.setAttribute("limitJSON", AppUtil.mapper.writeValueAsString(ELimit.values()));
//        req.setAttribute("profilesJSON", AppUtil.mapper.writeValueAsString(new Profile()));
//        req.setAttribute("posts",PostService.getPostService().findById(id)); // gửi user để jsp check xem edit hay là create User
//        req.setAttribute("postsJSON", new ObjectMapper().writeValueAsString(PostService.getPostService().findById(id))); // gửi qua user được tìm thấy bằng id để JS vẻ lên trang web
////        req.setAttribute("usersJSON", new ObjectMapper().writeValueAsString(UserService.getUsers()));
//        req.getRequestDispatcher(PAGE + AppConstant.POST_MANAGEMENT_PAGE)
//                .forward(req,resp);
//    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        if (checkIdNotFound(req, resp, id)) return;
        PostService.getPostService().delete(id);
        resp.sendRedirect(PAGE + "?message=Deleted");
    }

    private Post getValidPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
        Post post = (Post) AppUtil.getObjectWithValidation(req, Post.class, validators); //
        User user = new User(req.getParameter("email"));
        boolean existedEmail = UserService.getUserService().existByEmail(user.getEmail());

        if (errors.size() > 0 || !existedEmail) {
            PageableRequest request = new PageableRequest(
                    req.getParameter("search"),
                    req.getParameter("sortField"),
                    ESortType.valueOf(AppUtil.getParameterWithDefaultValue(req, "sortType", ESortType.DESC).toString()),
                    Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "page", "1").toString()),
                    Integer.parseInt(AppUtil.getParameterWithDefaultValue(req, "limit", "5").toString())
            ); //tao doi tuong pageable voi parametter search

            req.setAttribute("pageable", request);
            req.setAttribute("posts", PostService.getPostService().getPostList(request)); // gửi qua list users để jsp vẻ lên trang web
            req.setAttribute("postsJSON", new ObjectMapper().writeValueAsString(PostService.getPostService().getPostList(request)));
            req.setAttribute("postLimitJSON", new ObjectMapper().writeValueAsString(ELimit.values()));
//            req.setAttribute("categoriesJSON", new ObjectMapper().writeValueAsString(CategoryService.getCategories()));
            req.setAttribute("message", "Something was wrong");
            req.setAttribute("contentsJSON", new ObjectMapper().writeValueAsString(ContentService.getContents()));
            req.getRequestDispatcher(PAGE + AppConstant.POST_MANAGEMENT_PAGE)
                    .forward(req, resp);
        } else {
            Content content = new Content(req.getParameter("data"));
            Integer content_id = ContentService.getContentService().insertAndGetId(content);
            Integer profile_id = ProfileService.getProfileService().findProfileIdByEmail(user.getEmail());
            content.setId(content_id);
            assert post != null;
            post.setContent(content);
            post.setProfile(new Profile(Integer.parseInt(String.valueOf(profile_id))));
        }
        return post;
    }

    private boolean checkIdNotFound(HttpServletRequest req, HttpServletResponse resp, Integer id) throws IOException {
        if (!ProfileService.getProfileService().existById(id)) {
            resp.sendRedirect(PAGE + "?message=Id not found");
            return true;
        }
        return false;
    }
}


