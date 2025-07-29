package com.studio.Design.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studio.Design.domain.Cart;
import com.studio.Design.domain.User;

public interface CartRepository extends JpaRepository<Cart, Long> {

    Cart findByUser(User user);
}
