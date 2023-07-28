package controller;

import Utils.AppUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
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


@WebServlet(urlPatterns = "/users", name = "UserManagerController")
public class UserManagerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("lock".equals(action)) {
            lock(req, resp);
            return;
        }
        if ("edit".equals(action)) {
            return;
        }
        List<User> userList = UserService.getInstance().findAll();
        // Convert the List<Object> to JSON using ObjectMapper
        ObjectMapper objectMapper = new ObjectMapper();
        String jsonData = objectMapper.writeValueAsString(userList);

        // Set content type to JSON
//        resp.setContentType("application/json");
        // Send JSON data as the HTTP response
//        resp.getWriter().write(jsonData);

        req.setAttribute("userList", userList);
        req.getRequestDispatcher("html/dashboard/user.jsp").forward(req, resp);

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("create".equals(action)) {
            User user = (User) AppUtil.getObject(req, User.class);
            if (user != null) UserService.getInstance().create(user);
            req.setAttribute("message", "Created successfully");
        }
        if ("edit".equals(action)) {
            User user = (User) AppUtil.getObject(req, User.class);
            UserService.getInstance().update(user);
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
