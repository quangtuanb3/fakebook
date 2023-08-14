package controller;

import DAO.ProfileUserDAO;
import DAO.UserDAO;
import Utils.AppConstant;
import Utils.RunnableCustom;
import Utils.RunnableWithRegex;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@WebServlet(urlPatterns = "/users/profile", name = "profileUserController")


public class ProfileUserController extends HttpServlet {
    private final String PAGE = "/users";

    private Map<String, RunnableCustom> validators;

    private final Map<String, String> errors = new HashMap<>();
    ProfileUserDAO profileUserDAO=new ProfileUserDAO();

    @Override
    public void init() {
        validators = new HashMap<>();
        validators.put("phone", new RunnableWithRegex("0[0-9]{9}", "phone", errors));
        validators.put("name", new RunnableWithRegex("^[A-Za-z ]{6,20}", "name", errors));
        validators.put("gender", new RunnableWithRegex("^(MALE|FEMALE|OTHER)$", "gender", errors));
    }
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String action = req.getParameter(AppConstant.ACTION);
//        if (Objects.equals(action, AppConstant.LOCK)) {
//            //kiểm tra xem action = create thi call edit
//            lock(req, resp);
//            return;
//        }
//        showTable(req, resp);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        errors.clear(); // clear lỗi cũ
//        req.setCharacterEncoding("UTF-8");
//
//        String action = req.getParameter(AppConstant.ACTION); // lấy action
//
//        if (Objects.equals(action, AppConstant.EDIT)) {
//            //kiểm tra xem action = create thi call edit
//            edit(req, resp);
//            return;
//        }if (Objects.equals(action, AppConstant.LOCK)) {
//            //kiểm tra xem action = create thi call edit
//            lock(req, resp);
//            return;
//        }
//
//        showTable(req, resp);
//    }
}
