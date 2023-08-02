package services;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import modals.Post;
import modals.User;
import Enum.EGender;
import Enum.ERole;
import Enum.EUserStatus;

import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

public class UserService {
    public static List<User> userList = new ArrayList<>();
    public static  User currentUser;

    private static UserService userService;

    static {
        userList.add(new User(++User.currentID, "Tuan Em", "08754682777", "email@gmail.com", UUID.randomUUID().toString(), ERole.USER, Date.valueOf("2020-10-01"), EGender.FEMALE, null, null, EUserStatus.ACTIVE));
        userList.add(new User(++User.currentID, "Binh", "08754688882", "email@gmail.com", UUID.randomUUID().toString(), ERole.USER, Date.valueOf("2020-10-01"), EGender.FEMALE, null, null, EUserStatus.ACTIVE));
        userList.add(new User(++User.currentID, "Huong", "08754699982", "email@gmail.com", UUID.randomUUID().toString(), ERole.USER, Date.valueOf("2020-10-01"), EGender.FEMALE, null, null, EUserStatus.ACTIVE));
        userList.add(new User(++User.currentID, "Nam", "08754000682", "email@gmail.com", UUID.randomUUID().toString(), ERole.USER, Date.valueOf("2020-10-01"), EGender.FEMALE, null, null, EUserStatus.ACTIVE));
        currentUser = userList.get(0);
    }

    public List<User> findAll() {
        return userList;
    }

    public User findById(Integer id) {
        return userList.stream().filter(e -> Objects.equals(e.getId(), id)).findFirst().orElse(null);
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

    public void create(User user) {
        user.setId(getNextId());
        userList.add(user);
    }

    private Integer getNextId() {
        return ++User.currentID;

    }

    public void update(User user) {
        userList.stream().filter(existUser -> existUser.getEmail().equals(user.getEmail()))
                .findFirst()
                .ifPresent(existUser -> userList.set(userList.indexOf(existUser), user));
    }


}
