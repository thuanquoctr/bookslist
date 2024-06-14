package com.example.ASM.service;

import com.example.ASM.entity.oder;

import java.util.List;

public interface oderService {
    public oder save(oder oder);

    public oder update(oder oder);

    public oder findById(int id);

    public List<oder> findAll();

    public List<oder> findByUserId(int id);

    public void deleteById(int id);

    public int getcount();

    public Double getSum();

    public List<oder> findTop3ByOrderByCreateDateDesc();
}
