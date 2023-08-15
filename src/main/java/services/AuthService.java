package services;

import DAO.UserDAO;
import Model.Enum.ERole;
import Model.Enum.EStatus;
import Model.Profile;
import Model.User;
import Utils.AppConstant;
import Utils.AppUtil;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;

public class AuthService {
    public void register(User user, Profile profile) {
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
        user.setRole(ERole.USER);
        user.setStatus(EStatus.ACTIVE);
        UserService.getUserService().create(user);
        User userDB = UserDAO.getUserDAO().getUserByEmail(user.getEmail());
        profile.setUser(userDB);
        ProfileService.getProfileService().create(profile);
    }

    public String login(User user, HttpServletRequest request) throws RuntimeException {
        final String incorrectMsg = "Username or password incorrect";
        final String lockMsg = "Your account has been locked! Please contact to Admin to get more detail";
        var userDB = UserDAO.getUserDAO().getUserByEmail(user.getEmail());
        if(userDB == null){
            throw new RuntimeException(incorrectMsg);
        }
        if (BCrypt.checkpw(user.getPassword(), userDB.getPassword())) {
            if(userDB.getStatus().equals(EStatus.ACTIVE)){
                var session = request.getSession();
                session.setAttribute("user", userDB);
                if(userDB.getRole().equals(ERole.USER)){
                    return AppConstant.USERS_DIRECT_PAGE;
                } else if(userDB.getRole().equals(ERole.ADMIN)) return AppConstant.ADMIN_USERS_MANAGEMENT_PAGE;
            } else throw new RuntimeException(lockMsg);
        } else {
            throw new RuntimeException(incorrectMsg);
        }
        return AppConstant.USERS_DIRECT_PAGE;
    }
}
