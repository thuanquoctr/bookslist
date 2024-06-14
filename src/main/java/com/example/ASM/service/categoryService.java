package com.example.ASM.service;

import com.example.ASM.entity.category;
import org.springframework.stereotype.Service;

import java.util.List;

public interface categoryService {
    public category insert(category category);

    public category update(category category);

    public void delete(int id);

    public category getById(int id);

    public List<category> getAllcategory();

    public category findByName(String name);

}
