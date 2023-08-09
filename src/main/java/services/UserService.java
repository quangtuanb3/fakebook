package services;

import DAO.UserDAO;
import Model.User;

import java.util.List;

public class UserService {
    public static List<User> getUsers(){
        return new UserDAO().getUsers();
    }

}
