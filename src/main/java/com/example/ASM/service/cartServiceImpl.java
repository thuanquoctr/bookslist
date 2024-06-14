package com.example.ASM.service;

import com.example.ASM.entity.book;
import com.example.ASM.entity.cart;
import com.example.ASM.entity.cartItem;
import com.example.ASM.entity.user;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

@Service
@Transactional
public class cartServiceImpl implements cartService {
    private userService userService;
    private bookService bookService;

    @Autowired
    public cartServiceImpl(userService userService, bookService bookService) {
        this.userService = userService;
        this.bookService = bookService;
    }

    @Override
    public cart addItem(int userId, int bookId) {
        user user = userService.getById(userId);
        book book = bookService.getBookById(bookId);
        cart cart = user.getCart();
        List<cartItem> cartItems = cart.getCartItems();
        cartItem cartItem = findCartItemByBookId(cartItems, bookId);
        if (cartItem == null) {
            cartItem = new cartItem();
            cartItem.setBook(book);
            cartItem.setQuantity(1);
            cartItem.setCart(cart);
            cartItems.add(cartItem);
        } else {
            cartItem.incrementQuantity();
        }
        userService.insert(user);
        return cart;
    }

    @Override
    public void removeItem(int userId, int bookId) {
        user user = userService.getById(userId);
        cart cart = user.getCart();
        if (cart != null) {
            List<cartItem> cartItems = cart.getCartItems();
            cartItems.removeIf(cartItem -> cartItem.getBook().getId() == bookId);
            userService.insert(user);
        }
    }

    @Override
    public cart updateItem(int userId, int bookId, int qty) {
        user user = userService.getById(userId);
        cart cart = user.getCart();
        if (cart != null) {
            List<cartItem> cartItems = cart.getCartItems();
            cartItem cartItem = findCartItemByBookId(cartItems, bookId);
            if (cartItem != null) {
                if (qty > 0) {
                    cartItem.setQuantity(qty);
                } else {
                    cartItems.remove(cartItem);
                }
                userService.insert(user);
            }
        }
        return cart;
    }

    @Override
    public void clear(int userId) {
        user user = userService.getById(userId);
        if (user == null) {
            throw new IllegalArgumentException("User not found");
        }
        cart cart = user.getCart();
        if (cart != null) {
            cart.getCartItems().clear();
            userService.insert(user);
        }
    }

    @Override
    public Collection<cartItem> getItems(int userId) {
        user user = userService.getById(userId);
        cart cart = user.getCart();
        if (cart != null) {
            return cart.getCartItems();
        }
        return List.of();
    }

    @Override
    public int getCount(int userId) {
        user user = userService.getById(userId);
        cart cart = user.getCart();
        if (cart != null) {
            return cart.getCartItems().size();
        }
        return 0;
    }

    @Override
    public double getAmount(int userId) {
        user user = userService.getById(userId);
        cart cart = user.getCart();
        if (cart != null) {
            return cart.getCartItems().stream()
                    .mapToDouble(item -> item.getBook().getSelling_price() * item.getQuantity())
                    .sum();
        }
        return 0;
    }

    @Override
    public void increaseQuantity(int userId, int bookId) {
        user user = userService.getById(userId);
        cart cart = user.getCart();
        if (cart != null) {
            List<cartItem> cartItems = cart.getCartItems();
            cartItem cartItem = findCartItemByBookId(cartItems, bookId);
            if (cartItem != null) {
                cartItem.incrementQuantity();
                userService.insert(user);
            }
        }
    }

    // New method to decrease the quantity of a cart item
    @Override
    public void decreaseQuantity(int userId, int bookId) {
        user user = userService.getById(userId);
    }

    private cartItem findCartItemByBookId(List<cartItem> cartItems, int bookId) {
        for (cartItem cartItem : cartItems) {
            if (cartItem.getBook().getId() == bookId) {
                return cartItem;
            }
        }
        return null;
    }

}
