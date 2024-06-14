package com.example.ASM.repository;


import com.example.ASM.entity.cartItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface cartItemRepository extends JpaRepository<cartItem, Integer> {
    public cartItem findById(int id);
}
