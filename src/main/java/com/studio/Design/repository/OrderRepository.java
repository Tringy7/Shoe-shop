package com.studio.Design.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studio.Design.domain.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
