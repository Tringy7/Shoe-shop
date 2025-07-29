package com.studio.Design.service;

import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.studio.Design.domain.Cart;
import com.studio.Design.domain.CartDetail;
import com.studio.Design.domain.Product;
import com.studio.Design.domain.ProductDetail;
import com.studio.Design.domain.User;
import com.studio.Design.domain.dto.ProductCriterialDTO;
import com.studio.Design.repository.ProductRepository;
import com.studio.Design.service.spec.ProductSpecs;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductService {

    private ProductRepository productRepository;
    private ModelMapper modelMapper;
    private ProductDetailService productDetailService;
    private ProductSpecs productSpecs;
    private CartDetailService cartDetailService;
    private CartService cartService;
    private UserService userService;

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
                it.remove();
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
                if (tempQuantity <= 0) {
                    it.remove();
                    this.productDetailService.deleteProductDetail(pd.getId());
                } else {
                    pd.setQuantity(tempQuantity);
                }
                cnt++;
            }
            this.productDetailService.saveListProductDetail(productDetails);

            temp = modelMapper.map(product, Product.class);
            this.productRepository.save(temp);
        }
    }

    @Transactional
    public void deleteProduct(Long id) {
        Optional<Product> productCheck = this.productRepository.findById(id);
        if (productCheck.isPresent()) {
            Product product = productCheck.get();
            List<ProductDetail> pd = product.getProductDetails();
            for (ProductDetail it : pd) {
                this.productDetailService.deleteProductDetail(it.getId());
            }
        }
        this.productRepository.deleteById(id);
    }

    public Page getPage(Pageable pageable, ProductCriterialDTO productCriterialDTO) {
        if (productCriterialDTO.getBrand() == null
                && productCriterialDTO.getColor() == null
                && productCriterialDTO.getSize() == null) {
            return this.productRepository.findAll(pageable);
        }

        Specification<Product> combineSpec = (root, query, criteriaBuilder) -> criteriaBuilder.conjunction();;
        if (productCriterialDTO.getBrand() != null && productCriterialDTO.getBrand().isPresent()) {
            combineSpec = combineSpec.and(ProductSpecs.productCheckBrand(productCriterialDTO.getBrand().get()));
        }
        if (productCriterialDTO.getColor() != null && productCriterialDTO.getColor().isPresent()) {
            combineSpec = combineSpec.and(ProductSpecs.productCheckColor(productCriterialDTO.getColor().get()));
        }
        if (productCriterialDTO.getSize() != null && productCriterialDTO.getSize().isPresent()) {
            combineSpec = combineSpec.and(ProductSpecs.productCheckSize(productCriterialDTO.getSize().get()));
        }
        return this.productRepository.findAll(combineSpec, pageable);
    }

    public List<Product> showProductHP() {
        return this.productRepository.findAll(PageRequest.of(0, 8)).getContent();
    }

    @Transactional
    public void handleAddProductTocart(Long userId, Long productId, String size, Long quantity, HttpSession session) {
        User user = this.userService.getUser(userId);
        if (user != null) {
            Cart cart = this.cartService.getCartByUser(user);

            // Create new cart
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setSum(0L);
                newCart.setUser(user);
                cart = this.cartService.saveCart(newCart);
            }

            // Save cart detail
            Optional<Product> productCheck = this.productRepository.findById(productId);
            if (productCheck.isPresent()) {
                Product product = productCheck.get();
                CartDetail cartDetailCheck = this.cartDetailService.findByCartandProduct(cart, product, size);// Cart Detail of user not exist product
                if (cartDetailCheck == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setPrice(product.getPrice());
                    cartDetail.setProduct(product);
                    cartDetail.setQuantity(quantity);
                    cartDetail.setSizeProduct(size);

                    Long sumTemp = cart.getSum() + 1;
                    cart.setSum(sumTemp);
                    this.cartDetailService.saveCartDetail(cartDetail);
                    session.setAttribute("sum", sumTemp);
                } else {
                    cartDetailCheck.setQuantity(cartDetailCheck.getQuantity() + quantity);
                    this.cartDetailService.saveCartDetail(cartDetailCheck);
                }
            }
        }
    }
}
