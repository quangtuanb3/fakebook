package services;

import DAO.ProfileDAO;
import DAO.UserDAO;
import Model.Profile;
import Model.User;
import Utils.AppConstant;
import services.dto.PageableRequest;

import java.util.ArrayList;
import java.util.List;

public class UserService {
    public static List<User> userList ;
    public static Long currentID=0L;

    private static UserService userService;

    private static UserDAO userDAO = new UserDAO();

    static {
        userList = new ArrayList<>();
        userService = new UserService();
    }

    public static Object getUsers(PageableRequest request) {
       return userDAO.findAll( request);
    }

    public List<User> getUserList(PageableRequest request){
        return userDAO.findAll(request);
    }
//    public Profile findById(Integer id){
//        return userDAO.findById(id)
//                .orElseThrow(() ->  new RuntimeException(String.format(AppConstant.ID_NOT_FOUND, "User")));
//
//    }
    public void create(User user){
        userDAO.insertUser(user);
    }

    public static UserService getUserService() {
        return userService;
    }
    private UserService(){}

//    public void edit(User user) {
//        userDAO.updateProfile(user);
//    }

    public boolean existById(Integer id) {
        return userDAO.existByID(id);
    }
    public boolean existByEmail(String email) {
        return userDAO.existByEmail(email);
    }

    public void delete(Integer userId) {
        userDAO.deleteById(userId);
    }
    public void lock(Integer id) {
        userDAO.lock(id);

    }

    public User findByEmail(String email) {
      return userDAO.getUserByEmail(email);

    }
}
