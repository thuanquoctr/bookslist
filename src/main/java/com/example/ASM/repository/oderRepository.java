package com.example.ASM.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.example.ASM.entity.oder;

import java.util.List;

@Repository
public interface oderRepository extends JpaRepository<oder, Integer> {
    public List<oder> getAllByUserId(int userId);

    @Query("SELECT count(*) FROM oder")
    public int getCount();

    @Query("SELECT SUM(c.priceTotal) FROM oder c WHERE c.status = 'DA_GIAO_HANG'")
    public Double getSum();


    public List<oder> findTop3ByOrderByCreateDateDesc();

}
