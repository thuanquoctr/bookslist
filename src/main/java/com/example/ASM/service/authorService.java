package com.example.ASM.service;

import com.example.ASM.entity.author;

import java.util.List;

public interface authorService {
    public author insert(author author);

    public author update(author author);

    public void delete(author author);

    public author findById(int id);

    public author findByName(String name);

    public List<author> findAll();
}
