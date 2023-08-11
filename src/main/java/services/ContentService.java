package services;

import DAO.ContentDAO;
import DAO.PostDAO;
import Model.Content;
import Model.Post;
import Utils.AppConstant;
import services.dto.PageableRequest;

import java.util.ArrayList;
import java.util.List;

public class ContentService {
    public static List<Content> getContents(){
        return new ContentDAO()
                .getContent();
    }
}
