package API;

import java.io.IOException;
import java.util.List;

import Utils.AppConstant;
import com.fasterxml.jackson.databind.ObjectMapper; // Import the ObjectMapper class

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modals.User;
import services.UserService;

@WebServlet("/api/users")
public class fakeAPI extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (AppConstant.ACTION.equals(AppConstant.GET_USER)) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            User user = UserService.getInstance().findById(id);
            ObjectMapper objectMapper = new ObjectMapper();
            String userJson = objectMapper.writeValueAsString(user);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(userJson);
        }
    }
}
