package com.example.ASM.repository;

import com.example.ASM.entity.user;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import com.example.ASM.entity.book;

@Repository
public interface userRepository extends JpaRepository<user, Integer> {

    public user findByUsernameAndPassword(String username, String password);

    public List<user> findByAdminFalse();
}
