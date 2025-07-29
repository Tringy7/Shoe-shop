package com.studio.Design.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studio.Design.domain.ProductDetail;

public interface ProductDetailRepository extends JpaRepository<ProductDetail, Long> {
    ProductDetail fingByfindByProductIdAndSize(Long productId, String size);
}
