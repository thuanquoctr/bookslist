package com.example.ASM.service;

import com.example.ASM.entity.heart;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.ASM.repository.heartRepository;

import java.util.List;

@Service
@Transactional
public class heartServiceImpl implements heartService {
    private heartRepository heartRepository;

    @Autowired
    public heartServiceImpl(heartRepository heartRepository) {
        this.heartRepository = heartRepository;
    }

    @Override
    public heart addHeart(heart heart) {
        return heartRepository.save(heart);
    }

}
