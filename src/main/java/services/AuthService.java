package services;

import DAO.UserDAO;
import Model.Enum.ERole;
import Model.Enum.EStatus;
import Model.Profile;
import Model.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;

public class AuthService {
    public void register(User user, Profile profile) {
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
        user.setRole(ERole.USER);
        user.setStatus(EStatus.ACTIVE);
        UserService.getUserService().create(user);
        User userDB = UserDAO.getUserDAO().getUserByEmail(user.getEmail()).orElse(new User());
        profile.setUser(userDB);
        ProfileService.getProfileService().create(profile);
    }

    public void login(User user, HttpServletRequest request) throws RuntimeException {
        final String message = "Username or password incorrect";
        var userDB = UserDAO.getUserDAO().getUserByEmail(user.getEmail())
                .orElseThrow(() -> new RuntimeException(message));
        if (BCrypt.checkpw(user.getPassword(), userDB.getPassword())) {
            var session = request.getSession();
            session.setAttribute("user", userDB);
        } else {
            throw new RuntimeException(message);
        }
    }
}
