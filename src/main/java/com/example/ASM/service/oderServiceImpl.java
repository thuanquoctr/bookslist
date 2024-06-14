package com.example.ASM.service;


import com.example.ASM.entity.oder;
import com.example.ASM.repository.oderRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class oderServiceImpl implements oderService {
    private oderRepository oderRepository;

    @Autowired
    public oderServiceImpl(oderRepository oderRepository) {
        this.oderRepository = oderRepository;
    }

    @Override
    public oder save(oder oder) {
        return oderRepository.save(oder);
    }

    @Override
    public oder update(oder oder) {
        return oderRepository.saveAndFlush(oder);
    }

    @Override
    public oder findById(int id) {
        return oderRepository.findById(id).get();
    }

    @Override
    public List<oder> findAll() {
        return oderRepository.findAll();
    }

    @Override
    public List<oder> findByUserId(int id) {
        return oderRepository.getAllByUserId(id);
    }

    @Override
    public void deleteById(int id) {
        oderRepository.deleteById(id);
    }

    @Override
    public int getcount() {
        return oderRepository.getCount();
    }

    @Override
    public Double getSum() {
        return oderRepository.getSum();
    }

    @Override
    public List<oder> findTop3ByOrderByCreateDateDesc() {
        return oderRepository.findTop3ByOrderByCreateDateDesc();
    }
}
