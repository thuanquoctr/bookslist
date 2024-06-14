package com.example.ASM.service;


import java.util.List;
import java.util.Map;

import com.example.ASM.entity.book;
import com.example.ASM.entity.user;

public interface userService {

    public user insert(user user);

    public user delete(int id);

    public user update(user user);

    public user getById(int id);

    public List<user> getAll();

    public List<user> getAllAdminFalse();

    public user getByNameAndPassword(String name, String password);


}
