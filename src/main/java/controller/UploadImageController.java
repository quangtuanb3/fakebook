package controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import services.UploadService;

import javax.servlet.http.*;
import java.io.*;
import java.nio.file.Files;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.*;

@WebServlet("/uploadImage")
@MultipartConfig
public class UploadImageController extends HttpServlet {
    public static final String IMAGE_SAVE_DIRECTORY = "src/main/webapp/assets/images";
    public static final String  IMAGE_SAVE_SERVER  = "target/c0423i1-module-3-1.0-SNAPSHOT/assets/images";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get the uploaded file from the request
            Part filePart = request.getPart("avatar");
            String fileType = request.getParameter("fileType");
            List<String> allowedType = UploadService.allowedImageTypes;
            if (Objects.equals(fileType, "video")) {
                allowedType = UploadService.allowedVideoTypes;
            }
            // Generate a unique filename for the uploaded image
//            String fileName = UUID.randomUUID() + getExtension(filePart.getSubmittedFileName());

            // Save the image to a temporary file
            File tempFile = saveToTempFile(filePart);
            String fileName = tempFile.getName();
            // Create an instance of UploadService
            UploadService uploadService = new UploadService();

            // Save the temporary file to the server using the UploadService
            uploadService.upload(tempFile, IMAGE_SAVE_DIRECTORY,IMAGE_SAVE_SERVER ,allowedType);

            // Delete the temporary file after it has been uploaded
            tempFile.delete();

            // Create a response JSON object with the image URL
            String imageUrl = "/assets/images/" + fileName; // Change "/images/" to the URL path of your image directory

            // Create an ObjectMapper instance
            ObjectMapper objectMapper = new ObjectMapper();

            // Create a Map to store the response data
            Map<String, String> responseData = new HashMap<>();
            responseData.put("imageUrl", imageUrl);

            // Convert the Map to a JSON string
            String jsonResponse = objectMapper.writeValueAsString(responseData);

            // Set the response content type to JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Write the JSON response back to the client
            PrintWriter writer = response.getWriter();
            writer.print(jsonResponse);
            writer.flush();
        } catch (Exception e) {
            // Handle any errors that occur during the image upload process
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            e.printStackTrace();
        }
    }

    public static File saveToTempFile(Part part) throws IOException {
        String fileName = part.getSubmittedFileName();
        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
        LocalDateTime now = LocalDateTime.now();
        File tempFile = File.createTempFile("file", fileExtension);

        try (InputStream inputStream = part.getInputStream();
             FileOutputStream outputStream = new FileOutputStream(tempFile)) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
        return tempFile;
    }

    private String getExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf(".");
        return dotIndex == -1 ? "" : fileName.substring(dotIndex);
    }
}
