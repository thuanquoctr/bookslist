package com.example.ASM.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.ASM.entity.picture;

@Repository
public interface pictureRepository extends JpaRepository<picture, Integer> {
}
