package com.studio.Design.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studio.Design.domain.Product;
import com.studio.Design.domain.ProductDetail;

public interface ProductDetailRepository extends JpaRepository<ProductDetail, Long> {

    ProductDetail findByProductAndSize(Product product, String size);
}
