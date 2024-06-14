package com.example.ASM.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "book_id")
    private int id;
    private String title;
    private String pictureMain;
    private String description;
    private Double list_price;
    private Double selling_price;
    private Double discount;
    private Integer quantity;
    private boolean enable_discount;
    private String publishing_company;
    private String publisher;
    private int view = 0;
    private int quantitySold = 0;
    @ManyToOne(fetch = FetchType.EAGER, cascade = {
            CascadeType.DETACH,
            CascadeType.MERGE,
            CascadeType.REFRESH,
            CascadeType.PERSIST})
    @JoinColumn(name = "category_id")
    private category category;
    @Temporal(TemporalType.DATE)
    private Date createDate = new Date();
    @ManyToOne(fetch = FetchType.EAGER, cascade = {
            CascadeType.DETACH,
            CascadeType.MERGE,
            CascadeType.REFRESH,
            CascadeType.REMOVE})
    @JoinColumn(name = "author_id")
    private author author;
    @OneToMany(mappedBy = "book", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<review_book> review_books;

    @OneToMany(mappedBy = "book", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<picture> pictureList;

    public double getAvgStar() {
        if (review_books != null && !review_books.isEmpty()) {
            double sum = 0;
            for (review_book review_book : review_books) {
                sum += review_book.getStar();
            }
            return sum / review_books.size();
        }
        return 0;
    }

    public boolean checkreview(int user_id) {
        if (review_books != null && !review_books.isEmpty()) {
            for (review_book review_book : review_books) {
                if (review_book.getUser().getId() == user_id) {
                    return false;
                } else {
                }
            }
        }
        return true;
    }
}
