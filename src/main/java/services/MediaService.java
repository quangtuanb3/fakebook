package services;

import DAO.ContentDAO;
import DAO.MediaDAO;
import Model.Content;
import Model.Media;

import java.sql.SQLException;
import java.util.List;

public class MediaService {
    private static MediaService mediaService;

    static {
        mediaService = new MediaService();
    }

    public static MediaService getMediaService() {
        return mediaService;
    }

    public void insertMedia(Media media) {
        MediaDAO.getMediaDAO().insertMedia(media);
    }



//    public Integer insertAndGetId(Media media) throws SQLException {
//        return MediaDAO.getMediaDAO().insertAndGetId(media);
//    }

//    public Content findById(int contentId) {
//       return ContentDAO.getContentDAO().findById(contentId);
//    }
//
//    public void update(Content content) {
//        ContentDAO.getContentDAO().update(content);
//    }
}
