package services;

import DAO.ProfileDAO;
import Model.Profile;
import Utils.AppConstant;
import services.dto.PageableRequest;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProfileService {
    public static List<Profile> profileList = new ArrayList<>();
    public static Long currentID=0L;

    private static ProfileService profileService;

    private ProfileDAO profileDAO = new ProfileDAO();

    static {
        profileList = new ArrayList<>();

        profileService = new ProfileService();
    }

    public List<Profile> getProfileList(PageableRequest request){
        return profileDAO.findAll(request);
    }
    public Profile findById(Integer id){
        return profileDAO.findById(id)
                .orElseThrow(() ->  new RuntimeException(String.format(AppConstant.ID_NOT_FOUND, "Profile")));

    }
    public void create(Profile profile){
        profileDAO.insertProfile(profile);
    }

    public static ProfileService getProfileService() {
        return profileService;
    }
    private ProfileService(){}

    public void edit(Profile profile) {
        profileDAO.updateProfile(profile);
    }

    public boolean existById(Integer id) {
        return profileDAO.existByID(id);
    }

    public Integer findProfileIdByEmail(String email){
        return profileDAO.findProfileIdByEmail(email);
    }
}
