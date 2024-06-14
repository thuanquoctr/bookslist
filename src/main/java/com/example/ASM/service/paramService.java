package com.example.ASM.service;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;

@Service
public class paramService {

    @Autowired
    HttpServletRequest request;

    public String getString(String name, String defaultValue) {
        String value = request.getParameter(name);
        return (value != null) ? value : defaultValue;
    }

    public int getInt(String name, int defaultValue) {
        String value = request.getParameter(name);
        return (value != null) ? Integer.parseInt(value) : defaultValue;
    }

    public double getDouble(String name, double defaultValue) {
        String value = request.getParameter(name);
        return (value != null) ? Double.parseDouble(value) : defaultValue;
    }

    public boolean getBoolean(String name, boolean defaultValue) {
        String value = request.getParameter(name);
        return (value != null) ? Boolean.parseBoolean(value) : defaultValue;
    }

    public Date getDate(String name, String pattern) {
        String value = request.getParameter(name);
        // Parse date logic here using SimpleDateFormat or other libraries
        return null; // Placeholder for date parsing logic
    }

    public File save(MultipartFile file, String path) {
        if (file.isEmpty()) {
            return null; // No file uploaded
        }

        try {
            File directory = new File(path);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // Lưu file
            String fileName = file.getOriginalFilename();
            String filePath = path + File.separator + fileName;
            File dest = new File(filePath);
            file.transferTo(dest);
            return dest;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to save file: " + e.getMessage());
        }
    }
}
