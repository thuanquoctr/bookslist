package com.example.ASM.service;

import com.example.ASM.entity.author;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.ASM.repository.authorRepository;

import java.util.List;

@Service
@Transactional
public class authorServiceImpl implements authorService {
    private authorRepository authorReponsitory;

    @Autowired
    public authorServiceImpl(authorRepository authorReponsitory) {
        this.authorReponsitory = authorReponsitory;
    }

    @Override
    public author insert(author author) {
        return authorReponsitory.save(author);
    }

    @Override
    public author update(author author) {
        return authorReponsitory.saveAndFlush(author);
    }

    @Override
    public void delete(author author) {
        authorReponsitory.delete(author);
    }

    @Override
    public author findById(int id) {
        return authorReponsitory.findById(id).get();
    }

    @Override
    public author findByName(String name) {
        return authorReponsitory.findByName(name);
    }

    @Override
    public List<author> findAll() {
        return authorReponsitory.findAll();
    }
}
