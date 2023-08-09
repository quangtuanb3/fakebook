//package controller;
//
//import Utils.AppUtil;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import Model.Profile;
//import services.ProfileService;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
//import services.dto.Enum.EUserStatus;
//
//import static org.glassfish.json.JsonUtil.toJson;
//
//
//@WebServlet(urlPatterns = "/users", name = "UserManagerController")
//public class UserManagerController extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String action = req.getParameter("action");
//        if ("get".equals(action)) {
//            Integer userId = Integer.parseInt(req.getParameter("id"));
//            Profile user = ProfileService.getInstance().findById(userId);
//            if (user != null) {
//                resp.setContentType("application/json");
//                resp.getWriter().write(new ObjectMapper().writeValueAsString(user));
//            } else {
//                resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
//            }
//            return;
//        }
//
//        if ("lock".equals(action)) {
//            lock(req, resp);
//            return;
//        }
//
//
//        // If the action is not "get", "lock", or "edit", return the list of users
//        List<Profile> userList = ProfileService.getInstance().findAll();
//        req.setAttribute("userList", userList);
//        req.getRequestDispatcher("html/dashboard/users-management.jsp").forward(req, resp);
//    }
//
//
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
//            throws ServletException, IOException {
//        String action = req.getParameter("action");
//        if ("create".equals(action)) {
//            Profile user = (Profile) AppUtil.getObject(req, Profile.class);
//
//            if (user != null) ProfileService.getInstance().create(user);
//            assert user != null;
//            System.out.println(user);
//            req.setAttribute("message", "Created successfully");
//        }
//        if ("edit".equals(action)) {
//            Profile user = (Profile) AppUtil.getObject(req, Profile.class);
//            ProfileService.getInstance().update(user);
//        }
//
//        List<Profile> userList = ProfileService.getInstance().findAll();
//        req.setAttribute("userList", userList);
//        req.getRequestDispatcher("html/dashboard/users-management.jsp").forward(req, resp);
//    }
//
//    private void lock(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//        Integer id = Integer.valueOf(req.getParameter("id"));
//        if (!ProfileService.getInstance().existById(id)) {
//            resp.sendRedirect("/users?message=Id not found");
//            return;
//        }
//        ProfileService.getInstance().getByID(id).setStatus(EUserStatus.setStatus("lock"));
//        resp.sendRedirect("/users?message=Locked");
//    }
//
//}
