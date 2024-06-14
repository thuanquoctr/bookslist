package com.example.ASM.service;

import com.example.ASM.entity.book;
import org.springframework.data.domain.Page;

import java.util.List;

public interface bookService {
    public book insertBook(book book);

    public book updateBook(book book);

    public void deleteBook(book book);

    public book getBookById(int id);

    public List<book> getAllBooks();

    public List<book> getBooksByAuthor(String author);

    public List<book> getBooksByTitle(String title);

    Page<book> getBooksByPageAtoZ(int pageNumber, int pageSize);

    Page<book> getBooksByPagePriceUp(int pageNumber, int pageSize);

    Page<book> getBooksByPagePriceDown(int pageNumber, int pageSize);

    Page<book> getBooksByPageQuantitySold(int pageNumber, int pageSize);

    Page<book> getBooksByPageView(int pageNumber, int pageSize);

    Page<book> getBooksByPageReview(int pageNumber, int pageSize);
    public int getCountBook();
}
