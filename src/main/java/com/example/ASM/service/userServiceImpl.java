package com.example.ASM.service;

import com.example.ASM.entity.book;
import com.example.ASM.entity.user;
import com.example.ASM.repository.userRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class userServiceImpl implements userService {
    private userRepository userRepository;

    @Autowired
    public userServiceImpl(userRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public user insert(user user) {
        return userRepository.save(user);
    }

    @Override
    public user delete(int id) {
        user us = userRepository.getOne(id);
        if (us != null) {
            userRepository.delete(us);
        }
        return us;
    }

    @Override
    public user update(user user) {
        return userRepository.saveAndFlush(user);
    }

    @Override
    public user getById(int id) {
        return userRepository.findById(id).get();
    }


    @Override
    public List<user> getAll() {
        return userRepository.findAll();
    }

    @Override
    public List<user> getAllAdminFalse() {
        return userRepository.findByAdminFalse();
    }

    @Override
    public user getByNameAndPassword(String name, String password) {
        return userRepository.findByUsernameAndPassword(name, password);
    }


}
