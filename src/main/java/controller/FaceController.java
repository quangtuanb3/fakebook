package controller;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "FaceController", value = "/login")
public class FaceController extends HttpServlet {

    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "1";
    private static final String NORMAL_USERNAME = "user";
    private static final String NORMAL_PASSWORD = "1";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && password != null) {
            if (username.equals(ADMIN_USERNAME) && password.equals(ADMIN_PASSWORD)) {
                // User is an admin, redirect to the admin dashboard
                redirectToPage(response, "/html/dashboard/login.jsp");
            } else if (username.equals(NORMAL_USERNAME) && password.equals(NORMAL_PASSWORD)) {
                // User is a normal user, redirect to the home page
                redirectToPage(response, "/html/login.jsp");
            } else {
                // Invalid credentials, redirect back to the login page
                redirectToPage(response, "login.jsp");
            }
        } else {
            // Invalid login request, redirect back to the login page
            redirectToPage(response, "login.jsp");
        }
    }

    private void redirectToPage(HttpServletResponse response, String page) throws IOException {
        // Assuming your web application has URLs like "/dashboard" and "/home"
        // Adjust the base URL according to your application's structure.
        String baseURL = "/html"; // Replace with your actual base URL
        String redirectURL = baseURL + page;

        response.sendRedirect(page);
    }
}