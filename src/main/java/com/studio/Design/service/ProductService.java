package com.studio.Design.service;

import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import com.studio.Design.domain.Product;
import com.studio.Design.domain.ProductDetail;
import com.studio.Design.repository.ProductRepository;

import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductService {

    private ProductRepository productRepository;
    private ModelMapper modelMapper;
    private ProductDetailService productDetailService;

    public List<Product> getAllProduct() {
        return this.productRepository.findAll();
    }

    @Transactional
    public void createProduct(Product product) {
        String[] sizes = {"S", "M", "L", "XL"};
        this.productRepository.save(product);
        List<ProductDetail> productDetails = product.getProductDetails();
        Iterator<ProductDetail> it = productDetails.iterator();
        int cnt = 0;
        while (it.hasNext()) {
            ProductDetail temp = it.next();
            temp.setSold(0L);
            temp.setSize(sizes[cnt]);
            temp.setProduct(product);
            if (temp.getQuantity() <= 0) {
                temp.setQuantity(0L);
            }
            cnt++;
        }
        this.productDetailService.saveListProductDetail(productDetails);
    }

    public Product getProduct(Long id) {
        return this.productRepository.findById(id).get();
    }

    @Transactional
    public void updateProduct(Product product) {
        Optional<Product> productCheck = this.productRepository.findById(product.getId());
        if (productCheck.isPresent()) {
            Product temp = productCheck.get();

            List<ProductDetail> productDetails = temp.getProductDetails();
            Iterator<ProductDetail> it = productDetails.iterator();
            int cnt = 0;
            while (it.hasNext()) {
                ProductDetail pd = it.next();
                Long tempQuantity = product.getProductDetails().get(cnt).getQuantity();
                if (tempQuantity < 0) {
                    pd.setQuantity(0L);
                }
                pd.setQuantity(tempQuantity);
            }
            this.productDetailService.saveListProductDetail(productDetails);

            temp = modelMapper.map(product, Product.class);
            this.productRepository.save(temp);
        }
    }

    @Transactional
    public void deleteProduct(Long id) {
        this.productRepository.deleteById(id);
    }

}
