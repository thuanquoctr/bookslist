package com.example.ASM.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class heart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "heart_id")
    private int id;
    @ManyToMany(fetch = FetchType.EAGER, cascade = {
            CascadeType.DETACH,
            CascadeType.MERGE,
            CascadeType.REFRESH,
            CascadeType.PERSIST})
    @JoinTable(
            name = "heart_book",
            joinColumns = @JoinColumn(name = "heart_id"),
            inverseJoinColumns = @JoinColumn(name = "book_id"))
    private List<book> books;

    public void addBook(book book) {
        if (this.books == null) {
            this.books = new ArrayList<>();
        }
        this.books.add(book);
    }
}
