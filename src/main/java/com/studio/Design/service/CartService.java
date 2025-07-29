package com.studio.Design.service;

import java.util.List;
import java.util.Optional;

import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import com.studio.Design.domain.Cart;
import com.studio.Design.domain.User;
import com.studio.Design.repository.CartRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CartService {

    private CartRepository cartRepository;

    public Cart getCartByUser(User user) {
        Optional<Cart> cartCheck = this.cartRepository.findByUser(user);
        if (cartCheck.isPresent()) {
            Cart cart = cartCheck.get();
            return cart;
        }
        return new Cart();
    }

    @Transactional
    public Cart saveCart(Cart cart) {
        return this.cartRepository.save(cart);
    }
}
