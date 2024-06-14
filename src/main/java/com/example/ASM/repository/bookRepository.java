package com.example.ASM.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.example.ASM.entity.book;

import java.util.List;


@Repository
public interface bookRepository extends JpaRepository<book, Integer> {
    public Page<book> findAllByOrderByTitle(Pageable pageable);

    @Query("SELECT b FROM book b ORDER BY b.selling_price ASC")
    Page<book> findAllByOrderBySellingPriceAsc(Pageable pageable);

    @Query("SELECT b FROM book b ORDER BY b.selling_price DESC")
    Page<book> findAllByOrderBySellingPriceDesc(Pageable pageable);

    public Page<book> findAllByOrderByQuantitySoldDesc(Pageable pageable);

    public Page<book> findAllByOrderByViewDesc(Pageable pageable);

    @Query("SELECT b FROM book b ORDER BY SIZE(b.review_books) DESC")
    Page<book> findAllByOrderByReview_booksDesc(Pageable pageable);
    @Query("SELECT count(*) FROM book ")
    public int getCountBook();
}
