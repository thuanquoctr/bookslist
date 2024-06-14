package com.example.ASM.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.ASM.entity.category;
import org.springframework.stereotype.Repository;

@Repository
public interface categoryRepository extends JpaRepository<category, Integer> {
    public category findByName(String name);
}
