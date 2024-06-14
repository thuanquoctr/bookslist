package com.example.ASM.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class user {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private int id;
    private String fullname;
    private String email;
    private String username;
    private String password;
    private boolean enabled;
    private String avatar;
    private boolean admin;
    private Double coin = 0.0;
    @Temporal(TemporalType.DATE)
    private Date createDate = new Date();

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "cart_id")
    private cart cart;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "heart_id")
    private heart heart;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<address> addresses;

}
