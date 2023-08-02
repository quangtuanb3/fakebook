package controller;

import Utils.AppConstant;
import Utils.AppUtil;
import Utils.RunnableCustom;
import Utils.RunnableWithRegex;
import com.fasterxml.jackson.databind.ObjectMapper;
import modals.Post;
import services.PostService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@WebServlet(urlPatterns = "/profiles", name = "profileController")
public class ProfileController extends HttpServlet {
    private final String PAGE = "profiles"; // đặt hằng số

    private Map<String, RunnableCustom> validators;

    private final Map<String, String> errors = new HashMap<>(); // tạo map để validators add lỗi vào map này

    @Override
    public void init() {
        validators = new HashMap<>();
        // tạo validator với name field là phone, và nó validate theo Regex Pattern
        // tạo tất các validator cho all fields.
        // mình có thế xài cái thằng khác
//        validators.put("phone", new RunnableWithRegex("[0-9]{10}", "phone", errors));
//        validators.put("dob", new RunnableWithRegex("[0-9]{10}", "dob", errors));
        //định nghĩa tất cả các fields
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter(AppConstant.ACTION);

        if (Objects.equals(action, AppConstant.EDIT)) {
            showEdit(req, resp);
            return;
        }
        if (Objects.equals(action, AppConstant.CREATE)) {
            showCreate(req, resp);
            return;
        }
        if (Objects.equals(action, AppConstant.DELETE)) {
            delete(req, resp);
            return;
        }
        showList(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        errors.clear(); // clear lỗi cũ
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
        Post post = getValidPost(req, resp); // lấy ra user và + xử lý cho việc validation của các field trong class User.
        if (errors.size() == 0) { //không xảy lỗi (errors size == 0) thì mình mới tạo user.
            PostService.getPostService().create(post);
            resp.sendRedirect("/users?message=Created");
        }

    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Post post = getValidPost(req, resp); // lấy ra user và + xử lý cho việc validation của các field trong class User.
        if (errors.size() == 0) { //không xảy lỗi (errors size == 0) thì mình mới sửa user.
            PostService.getPostService().edit(post);
            resp.sendRedirect("/users?message=Edited");
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("postList", PostService.getPostService().findAll()); // gửi qua list users để jsp vẻ lên trang web
        req.setAttribute("message", req.getParameter("message")); // gửi qua message để toastr show thông báo
        req.getRequestDispatcher(AppConstant.PROFILE_PAGE).forward(req, resp);
    }

    private void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("postJSON", new ObjectMapper().writeValueAsString(new Post())); // gửi qua user rỗng để JS vẻ lên trang web
        req.getRequestDispatcher(AppConstant.PROFILE_PAGE)
                .forward(req, resp);
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        if (checkIdNotFound(req, resp, id)) return;

        req.setAttribute("post", PostService.getPostService().findById(id)); // gửi user để jsp check xem edit hay là create User
        req.setAttribute("postJSON", new ObjectMapper().writeValueAsString(PostService.getPostService().findById(id))); // gửi qua user được tìm thấy bằng id để JS vẻ lên trang web
        req.getRequestDispatcher(AppConstant.PROFILE_PAGE)
                .forward(req, resp);
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        if (checkIdNotFound(req, resp, id)) return;
        PostService.getPostService().delete(id);
        resp.sendRedirect(AppConstant.PROFILE_PAGE + "?message=Deleted");
    }

    private Post getValidPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Post post = (Post) AppUtil.getObjectWithValidation(req, Post.class, validators); //
        if (errors.size() > 0) {
            req.setAttribute("postJSON", new ObjectMapper().writeValueAsString(post)); //hiểu dòng đơn giản là muốn gửi data qua JS thì phải xài thằng này  new ObjectMapper().writeValueAsString(user).
            req.setAttribute("message", "Something was wrong");
            req.getRequestDispatcher(AppConstant.PROFILE_PAGE)
                    .forward(req, resp);
        }
        return post;
    }

    private boolean checkIdNotFound(HttpServletRequest req, HttpServletResponse resp, Integer id) throws IOException {
        if (!PostService.getPostService().existById(id)) {
            resp.sendRedirect(AppConstant.PROFILE_PAGE + "?message=Id not found");
            return true;
        }
        return false;
    }
}
