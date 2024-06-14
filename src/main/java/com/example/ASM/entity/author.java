package com.example.ASM.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class author {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "author_id")
    private int id;
    private String name;
    @Temporal(TemporalType.DATE)
    private Date createDate = new Date();
}
