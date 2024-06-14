package com.example.ASM.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.example.ASM.entity.review_book;

@Repository
public interface reviewbookRepository extends JpaRepository<review_book, Integer> {
    @Query("SELECT AVG(rv.star) FROM review_book rv WHERE rv.book.id= ?1")
    public double avgStarByBookId(int book_id);
}
