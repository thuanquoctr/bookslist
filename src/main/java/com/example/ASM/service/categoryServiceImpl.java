package com.example.ASM.service;

import com.example.ASM.entity.category;
import com.example.ASM.repository.categoryRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class categoryServiceImpl implements categoryService {
    private categoryRepository categoryRepository;

    @Autowired
    public categoryServiceImpl(categoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public category insert(category category) {
        return categoryRepository.save(category);
    }

    @Override
    public category update(category category) {
        return categoryRepository.saveAndFlush(category);
    }

    @Override
    public void delete(int id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public category getById(int id) {
        return categoryRepository.findById(id).get();
    }

    @Override
    public List<category> getAllcategory() {
        return categoryRepository.findAll();
    }

    @Override
    public category findByName(String name) {
        return categoryRepository.findByName(name);
    }
}
