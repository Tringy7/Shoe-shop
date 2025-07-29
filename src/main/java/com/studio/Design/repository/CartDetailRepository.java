package com.studio.Design.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studio.Design.domain.Cart;
import com.studio.Design.domain.CartDetail;
import com.studio.Design.domain.Product;

public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {

    CartDetail findByCartAndProductAndSizeProduct(Cart cart, Product product, String size);
}
