package com.example.ASM.entity;


import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class review_book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id")
    private int id;
    private String content;
    private int star;
    @Temporal(TemporalType.DATE)
    private Date createDate = new Date();

    @Temporal(TemporalType.TIME)
    private Date createTime = new Date();
    @ManyToOne
    @JoinColumn(name = "book_id")
    private book book;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private user user;
}
