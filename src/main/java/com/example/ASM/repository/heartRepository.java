package com.example.ASM.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.ASM.entity.heart;

@Repository
public interface heartRepository extends JpaRepository<heart, Integer> {
}
