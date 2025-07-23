package com.studio.Design.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studio.Design.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

}
