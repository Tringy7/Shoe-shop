package com.studio.Design.service;

import java.util.List;
import java.util.Optional;

import org.hibernate.validator.internal.util.stereotypes.Lazy;
import org.springframework.stereotype.Service;

import com.studio.Design.domain.Cart;
import com.studio.Design.domain.CartDetail;
import com.studio.Design.domain.Product;
import com.studio.Design.repository.CartDetailRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CartDetailService {

    private CartDetailRepository cartDetailRepository;
    private @Lazy
    CartService cartService;

    @Transactional
    public void saveCartDetail(CartDetail cartDetail) {
        this.cartDetailRepository.save(cartDetail);
    }

    public CartDetail findByCartandProduct(Cart cart, Product product, String size) {
        return this.cartDetailRepository.findByCartAndProductAndSizeProduct(cart, product, size);
    }

    @Transactional
    public void handleDeleteCartDetail(Long id, HttpSession session) {
        Optional<CartDetail> cartDetailCheck = this.cartDetailRepository.findById(id);
        if (cartDetailCheck.isPresent()) {
            CartDetail cartDetail = cartDetailCheck.get();
            Cart cart = cartDetail.getCart();

            this.cartDetailRepository.delete(cartDetail);

            Long temp = cart.getSum() - 1;
            if (temp == 0) {
                cart.setSum(temp);
                this.cartService.saveCart(cart);
                session.setAttribute("sum", 0);
            } else {
                cart.setSum(temp);
                this.cartService.saveCart(cart);
                session.setAttribute("sum", temp);
            }
        }
    }

    @Transactional
    public void handleSaveCart(Cart cart) {
        List<CartDetail> cartDetail = cart.getCartDetails();
        for (CartDetail it : cartDetail) {
            Optional<CartDetail> cartDetailCheck = this.cartDetailRepository.findById(it.getId());
            if (cartDetailCheck.isPresent()) {
                CartDetail temp = cartDetailCheck.get();
                temp.setQuantity(it.getQuantity());
            }
        }
    }
}
