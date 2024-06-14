package com.example.ASM.service;

import com.example.ASM.entity.address;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.ASM.repository.addressRepository;

import java.util.List;

@Service
@Transactional
public class addressServiceImpl implements addressService {
    private addressRepository addressRepository;

    @Autowired
    public addressServiceImpl(addressRepository addressRepository) {
        this.addressRepository = addressRepository;
    }

    @Override
    public address save(address address) {
        return addressRepository.save(address);
    }

    @Override
    public void delete(address address) {
        addressRepository.delete(address);
    }

    @Override
    public address findById(int id) {
        return addressRepository.findById(id).get();
    }

    @Override
    public List<address> findByUserId(int id) {
        return addressRepository.findByUserId(id);
    }
}
