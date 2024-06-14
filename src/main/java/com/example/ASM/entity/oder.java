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
public class oder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "oder_id")
    private int id;
    private String receiver_name;
    private String receiver_note;
    private String receiver_phone;
    private String receiver_email;
    private String receiver_address;
    private String payment_methods;
    private String shipping_method;
    private double priceTotal;
    private String code_oder;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private user user;
    @Temporal(TemporalType.DATE)
    private Date createDate = new Date();
    @Temporal(TemporalType.TIME)
    private Date createTime = new Date();
    @Enumerated(EnumType.STRING)
    private oder_status status;


    @OneToMany(mappedBy = "oder", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    private List<oderDetail> oderDetails;

}
