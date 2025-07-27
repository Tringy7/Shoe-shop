package com.studio.Design.controller.client;

import java.util.List;

import com.studio.Design.service.ProductService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.studio.Design.domain.Product;

@Controller
@AllArgsConstructor
public class HomePageController {

    private ProductService productService;

    @GetMapping("/homepage")
    public String showHomePage(Model model) {
        List<Product> products = this.productService.showProductHP();
        model.addAttribute("productList", products);
        return "client/homepage/show";
    }

}
