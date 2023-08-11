package services;

import DAO.ContentDAO;
import DAO.PostDAO;
import Model.Content;
import Model.Post;
import Model.Profile;
import Utils.AppConstant;
import services.dto.PageableRequest;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContentService {
    private static ContentService contentService;

    static {
        contentService = new ContentService();
    }

    public static ContentService getContentService() {
        return contentService;
    }

    public static List<Content> getContents() {
        return new ContentDAO()
                .getContent();
    }

    public void create(Content content) {
        ContentDAO.getContentDAO().insertContent(content);
    }
//    public int getLastIndex(){
////        return ContentDAO.getContentDAO().getLastIndex();
//    }

    public Integer insertAndGetId(Content content) throws SQLException {
        return ContentDAO.getContentDAO().insertAndGetId(content);
    }

    public Content findById(int contentId) {
       return ContentDAO.getContentDAO().findById(contentId);
    }

    public void update(Content content) {
        ContentDAO.getContentDAO().update(content);
    }
}
