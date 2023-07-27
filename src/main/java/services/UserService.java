package services;

import modals.Post;
import modals.User;
import Enum.EGender;

import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class UserService {
    public static List<User> userList = new ArrayList<>();

    private static UserService userService;

    static {
        userList.add(new User(1, "An", "08754682", "email@gmail.com", Date.valueOf("2020-10-01"), EGender.FEMALE, null, null));
        userList.add(new User(2, "Binh", "08754682", "email@gmail.com", Date.valueOf("2020-10-01"), EGender.FEMALE, null, null));
        userList.add(new User(3, "Huong", "08754682", "email@gmail.com", Date.valueOf("2020-10-01"), EGender.FEMALE, null, null));
        userList.add(new User(4, "Nam", "08754682", "email@gmail.com", Date.valueOf("2020-10-01"), EGender.FEMALE, null, null));

    }

    public List<User> findAll() {
        return userList;
    }

    public void delete(Long id) {
        userList = userList
                .stream()
                .filter(user -> !Objects.equals(user.getId(), id))
                .toList();
    }

    public boolean existById(Integer userId) {
        var userOptional = userList
                .stream()
                .filter(user -> Objects.equals(user.getId(), userId))
                .findFirst().orElse(null);
        return userOptional != null;
    }

    public static UserService getInstance() {
        if (userService == null) {
            userService = new UserService();
        }
        return userService;
    }

    private UserService() {
    }

    public User getByID(Integer id) {
        return userList.stream().filter(e -> e.getId().equals(id)).findFirst().orElse(null);
    }
}
