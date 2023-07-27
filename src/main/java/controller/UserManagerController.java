package controller;

import modals.User;
import services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import Enum.EGender;
import Enum.EUserStatus;

import static services.UserService.userList;

@WebServlet(urlPatterns = "/users", name = "UserManagerController")
public class UserManagerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("lock".equals(action)) {
            lock(req, resp);
            return;
        }
        List<User> userList = UserService.getInstance().findAll();
        req.setAttribute("userList", userList);
        req.getRequestDispatcher("html/dashboard/user.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("create".equals(action)) {
            // App Ultils validation lất cho Id Gender.
            String name = req.getParameter("name");
            String phone = req.getParameter("phone");
            String dob = req.getParameter("dob");
            String email = req.getParameter("email");
            String gender = req.getParameter("gender");

            UserService.userList.add(new User(5, name, phone, email, Date.valueOf(dob),
                    EGender.setGender(gender), null, null));
            req.setAttribute("message", "Created successfully");
        }

        List<User> userList = UserService.getInstance().findAll();
        req.setAttribute("userList", userList);
        req.getRequestDispatcher("html/dashboard/user.jsp").forward(req, resp);
    }

    private void lock(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        if (!UserService.getInstance().existById(id)) {
            resp.sendRedirect("/users?message=Id not found");
            return;
        }
        UserService.getInstance().getByID(id).setStatus(EUserStatus.setStatus("lock"));
        resp.sendRedirect("/users?message=Locked");
    }

}
