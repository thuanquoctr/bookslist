package com.example.ASM.service;

import com.example.ASM.entity.book;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

import com.example.ASM.repository.bookRepository;

@Service
@Transactional
public class bookServiceImpl implements bookService {
    private bookRepository bookRepository;

    @Autowired
    public bookServiceImpl(bookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    @Override
    public book insertBook(book book) {
        return bookRepository.save(book);
    }

    @Override
    public book updateBook(book book) {
        return bookRepository.saveAndFlush(book);
    }

    @Override
    public void deleteBook(book book) {
        bookRepository.delete(book);
    }

    @Override
    public book getBookById(int id) {
        return bookRepository.findById(id).get();
    }

    @Override
    public List<book> getAllBooks() {
        return bookRepository.findAll();
    }

    @Override
    public List<book> getBooksByAuthor(String author) {
        return List.of();
    }

    @Override
    public List<book> getBooksByTitle(String title) {
        return List.of();
    }

    @Override
    public Page<book> getBooksByPageAtoZ(int pageNumber, int pageSize) {
        PageRequest pageRequest = PageRequest.of(pageNumber - 1, pageSize);
        return bookRepository.findAllByOrderByTitle(pageRequest);
    }

    @Override
    public Page<book> getBooksByPagePriceUp(int pageNumber, int pageSize) {
        PageRequest pageRequest = PageRequest.of(pageNumber - 1, pageSize);
        return bookRepository.findAllByOrderBySellingPriceAsc(pageRequest);
    }

    @Override
    public Page<book> getBooksByPagePriceDown(int pageNumber, int pageSize) {
        PageRequest pageRequest = PageRequest.of(pageNumber - 1, pageSize);
        return bookRepository.findAllByOrderBySellingPriceDesc(pageRequest);
    }

    @Override
    public Page<book> getBooksByPageQuantitySold(int pageNumber, int pageSize) {
        PageRequest pageRequest = PageRequest.of(pageNumber - 1, pageSize);
        return bookRepository.findAllByOrderByQuantitySoldDesc(pageRequest);
    }

    @Override
    public Page<book> getBooksByPageView(int pageNumber, int pageSize) {
        PageRequest pageRequest = PageRequest.of(pageNumber - 1, pageSize);
        return bookRepository.findAllByOrderByViewDesc(pageRequest);
    }

    @Override
    public Page<book> getBooksByPageReview(int pageNumber, int pageSize) {
        PageRequest pageRequest = PageRequest.of(pageNumber - 1, pageSize);
        return bookRepository.findAllByOrderByReview_booksDesc(pageRequest);
    }

    @Override
    public int getCountBook() {
        return bookRepository.getCountBook();
    }


}
