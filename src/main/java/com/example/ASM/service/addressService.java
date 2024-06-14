package com.example.ASM.service;

import com.example.ASM.entity.address;

import java.util.List;

public interface addressService {
    public address save(address address);

    public void delete(address address);

    public address findById(int id);

    public List<address> findByUserId(int id);
}
