package com.example.ASM.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.example.ASM.entity.book;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class cartItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cart_item_id")
    private int id;
    @ManyToOne(fetch = FetchType.LAZY, cascade = {
            CascadeType.PERSIST,
            CascadeType.MERGE,
            CascadeType.REFRESH,
            CascadeType.DETACH})
    @JoinColumn(name = "book_id")
    private book book;
    private int quantity;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {
            CascadeType.PERSIST,
            CascadeType.MERGE,
            CascadeType.REFRESH,
            CascadeType.DETACH})
    @JoinColumn(name = "cart_id")
    private cart cart;

    public void incrementQuantity() {
        this.quantity++;
    }

    public void decrementQuantity() {
        this.quantity--;
    }

}
