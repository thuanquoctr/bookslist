package com.example.ASM.service;

import com.example.ASM.entity.cartItem;
import com.example.ASM.repository.cartItemRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class cartItemServiceImpl implements cartItemService {
    private cartItemRepository cartItemRepository;

    @Autowired
    public cartItemServiceImpl(cartItemRepository cartItemRepository) {
        this.cartItemRepository = cartItemRepository;
    }

    @Override
    public List<cartItem> findAll() {
        return cartItemRepository.findAll();
    }
}
