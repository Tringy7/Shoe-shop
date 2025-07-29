package com.studio.Design.controller.client;

import java.util.ArrayList;
import java.util.List;

import com.studio.Design.domain.*;
import com.studio.Design.service.CartDetailService;
import com.studio.Design.service.CartService;
import com.studio.Design.service.ProductDetailService;
import jakarta.servlet.http.HttpSession;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.studio.Design.domain.dto.ProductCriterialDTO;
import com.studio.Design.service.ProductService;
import com.studio.Design.domain.Product_;

import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@AllArgsConstructor
public class ItemController {

    private ProductService productService;
    private ProductDetailService productDetailService;
    private CartDetailService cartDetailService;

    @GetMapping("/product")
    public String showProduct(
            Model model,
            ProductCriterialDTO productCriterialDTO,
            HttpServletRequest request
    ) {
        int page = 0;
        try {
            if (productCriterialDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriterialDTO.getPage().get());
            }
        } catch (Exception e) {
        }

        Pageable pageable = PageRequest.of(page, 6);
        if (productCriterialDTO.getSort() != null && productCriterialDTO.getSort().isPresent()) {
            String temp = productCriterialDTO.getSort().get();
            if (temp.equals("tang-dan")) {
                pageable = PageRequest.of(page, 4, Sort.by(Product_.PRICE).ascending());
            } else if (temp.equals("giam-dan")) {
                pageable = PageRequest.of(page, 4, Sort.by(Product_.PRICE).descending());

            } else {
                pageable = PageRequest.of(page, 4);
            }
        }
        Page<Product> ps = this.productService.getPage(pageable, productCriterialDTO);
        List<Product> prodList = ps.getContent().size() > 0 ? ps.getContent() : new ArrayList<>();

        String qs = request.getQueryString();
        if (qs != null) {
            // remove url page
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("productList", prodList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", ps.getTotalPages() - 1);
        model.addAttribute("queryString", qs);
        return "client/product/show";
    }

    @GetMapping("/product/{id}")
    public String showProductDetail(@PathVariable("id") Long id, Model model) {
        model.addAttribute("product", this.productService.getProduct(id));
        return "client/product/detail";
    }

    @PostMapping("/product/{id}")
    public String postMethodName(
            @PathVariable("id") Long id,
            @RequestParam("size") String size,
            @RequestParam("quantity") Long quantity,
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession(false);
        Cart cart = (Cart) session.getAttribute("cart");
        Product product = this.productService.getProduct(id);
        ProductDetail productDetail = this.productDetailService.getProductDetailBySize(product.getId(), size);

        if (productDetail.getQuantity() < quantity) {
            // loi
            return "client/product/detail";
        }

        CartDetail cartDetail = new CartDetail();
        cartDetail.setProduct(product);
        cartDetail.setCart(cart);
        cartDetail.setQuantity(quantity);
        cartDetail.setPrice(product.getPrice());

//        this.cartDetailService.saveCartDetail(cartDetail);
        return "redirect:/cart";
    }

}
