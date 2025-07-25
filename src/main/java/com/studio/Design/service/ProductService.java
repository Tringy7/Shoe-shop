package com.studio.Design.service;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import com.studio.Design.domain.Product;
import com.studio.Design.repository.ProductRepository;

import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductService {

    private ProductRepository productRepository;
    private ModelMapper modelMapper;

    public List<Product> getAllProduct() {
        return this.productRepository.findAll();
    }

    @Transactional
    public void createProduct(Product product) {
        this.productRepository.save(product);
    }

    public Product getProduct(Long id) {
        return this.productRepository.findById(id).get();
    }

    @Transactional
    public void updateProduct(Product product) {
        Optional<Product> productCheck = this.productRepository.findById(product.getId());
        if (productCheck.isPresent()) {
            Product temp = productCheck.get();
            temp = modelMapper.map(product, Product.class);
            this.productRepository.save(temp);
        }
    }

    @Transactional
    public void deleteProduct(Long id) {
        this.productRepository.deleteById(id);
    }
}
