package com.example.ASM.service;

import com.example.ASM.entity.cart;
import com.example.ASM.entity.cartItem;

import java.util.Collection;
import java.util.List;

public interface cartService {
    public cart addItem(int user_id, int book_id);

    public void removeItem(int user_id, int book_id);

    public cart updateItem(int user_id, int book_id, int qty);

    public void clear(int user_id);

    public Collection<cartItem> getItems(int user_id);

    public int getCount(int user_id);

    public double getAmount(int user_id);

    public void increaseQuantity(int userId, int bookId);

    public void decreaseQuantity(int userId, int bookId);
}
