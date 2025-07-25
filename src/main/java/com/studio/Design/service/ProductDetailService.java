package com.studio.Design.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.studio.Design.domain.ProductDetail;
import com.studio.Design.repository.ProductDetailRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductDetailService {

    private ProductDetailRepository productDetailRepository;

    public void saveListProductDetail(List<ProductDetail> temp) {
        this.productDetailRepository.saveAll(temp);
    }
}
