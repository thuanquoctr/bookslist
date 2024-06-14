package com.example.ASM.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.ASM.entity.cart;
import org.springframework.stereotype.Repository;


@Repository
public interface cartRepository extends JpaRepository<cart, Integer> {
}
