package com.studio.Design.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.studio.Design.domain.Product;
import com.studio.Design.service.ProductService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomePageController {

    private ProductService productService;

    @GetMapping("/")
    public String showHomePage(Model model) {
        List<Product> products = this.productService.showProductHP();
        model.addAttribute("productList", products);
        return "client/homepage/show";
    }

    @GetMapping("/about")
    public String showAbout() {
        return "client/about/show";
    }

    @GetMapping("/contact")
    public String showContact() {
        return "client/contact/show";
    }

    @GetMapping("/access-deny")
    public String showDeny() {
        return "client/auth/deny";
    }

}
