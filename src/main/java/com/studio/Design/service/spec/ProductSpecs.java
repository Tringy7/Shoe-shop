package com.studio.Design.service.spec;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.studio.Design.domain.Product;
import com.studio.Design.domain.Product_;

@Service
public class ProductSpecs {

    public static Specification<Product> productCheckBrand(List<String> brand) {
        return (root, query, criteriaBuilder)
                -> criteriaBuilder.in(root.get(Product_.BRAND)).value(brand);
    }

    public static Specification<Product> productCheckColor(List<String> color) {
        return (root, query, criteriaBuilder)
                -> criteriaBuilder.in(root.get(Product_.COLOR)).value(color);
    }

    public static Specification<Product> productCheckSize(List<String> sizes) {
        return (root, query, criteriaBuilder) -> {
            // Tránh duplicate nếu có join nhiều lần
            query.distinct(true);

            // Join với productDetails
            var join = root.join(Product_.PRODUCT_DETAILS);

            // Chỉ lọc theo size
            return join.get("size").in(sizes);
        };
    }
}
