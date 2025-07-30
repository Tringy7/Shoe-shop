package com.studio.Design.service;

import org.springframework.stereotype.Service;

import com.studio.Design.domain.Cart;
import com.studio.Design.domain.User;
import com.studio.Design.repository.CartRepository;

import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CartService {

    private CartRepository cartRepository;

    @Transactional
    public Cart saveCart(Cart cart) {
        return this.cartRepository.save(cart);
    }

    public Cart getCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    @Transactional
    public void deleteCart(Cart cart) {
        this.cartRepository.delete(cart);
    }

    @Transactional
    public void handleCartToOrder(Cart cart, Long userId) {

    }
}
