package services;

import modals.Post;
import modals.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class UserService {
    private static List<User> userList = new ArrayList<>();

    private static UserService userService;

    static {
        userList.add(new User());
        userList.add(new User());
        userList.add(new User());
        userList.add(new User());
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

    public boolean existById(Long postId) {
        var userOptional = userList
                .stream()
                .filter(user -> Objects.equals(user.getId(), postId))
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
}
