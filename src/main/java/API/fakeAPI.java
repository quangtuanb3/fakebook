package API;

//@WebServlet("/api/users")
//public class fakeAPI extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        if (AppConstant.ACTION.equals(AppConstant.GET_USER)) {
//            Integer id = Integer.parseInt(request.getParameter("id"));
//            User user = UserService.getInstance().findById(id);
//            ObjectMapper objectMapper = new ObjectMapper();
//            String userJson = objectMapper.writeValueAsString(user);
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write(userJson);
//        }
//    }
//}
