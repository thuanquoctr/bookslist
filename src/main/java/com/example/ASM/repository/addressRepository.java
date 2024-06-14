package com.example.ASM.repository;

import com.example.ASM.entity.address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface addressRepository extends JpaRepository<address, Integer> {
    public List<address> findByUserId(int userId);
}
