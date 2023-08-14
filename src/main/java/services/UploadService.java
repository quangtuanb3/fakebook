package services;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.List;

public class UploadService {
    public static final List<String> allowedImageTypes = Arrays.asList("jpg", "jpeg", "png", "gif", "bmp", "webp", "svg");
    public static final List<String> allowedVideoTypes = Arrays.asList("mp4", "avi", "mkv", "mov", "wmv", "flv", "webm", "m4v", "mpeg", "mpg", "3gp");

    public void upload(File file, String savePath, String saveServerPath, List<String> allowedFileTypes) throws IOException {
        String fileName = file.getName();
        String fileType = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

        if (!allowedFileTypes.contains(fileType)) {
            throw new IllegalArgumentException("File type not allowed!");
        }

        File saveDirectory = new File(savePath);
        File saveDirectoryServer = new File(saveServerPath);

        if (!saveDirectory.exists()) {
            saveDirectory.mkdirs();
        }
        if (!saveDirectoryServer.exists()) {
            saveDirectoryServer.mkdirs();
        }

        String saveFilePathDirect = savePath + File.separator + fileName;
        FileOutputStream outputStream = new FileOutputStream(saveFilePathDirect);
        String saveFilePathServer = saveServerPath + File.separator + fileName;
        FileOutputStream outputStreamServer = new FileOutputStream(saveFilePathServer);

        byte[] buffer = new byte[1024];
        int bytesRead;
        try (InputStream inputStream = Files.newInputStream(file.toPath())) {
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStreamServer.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            // Handle the exception if needed
        } finally {
            outputStreamServer.close();
            outputStream.close();
        }
    }

}
