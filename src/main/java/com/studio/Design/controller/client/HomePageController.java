package com.studio.Design.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.studio.Design.domain.Product;
import com.studio.Design.domain.User;
import com.studio.Design.service.ProductService;
import com.studio.Design.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomePageController {

    private ProductService productService;
    private UserService userService;

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
    public String showContact(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Long id = (Long) session.getAttribute("id");
        User user = this.userService.getUser(id);
        model.addAttribute("user", user);
        return "client/contact/show";
    }

    @PostMapping("/contact")
    public String handleContact(@ModelAttribute("user") User user, @RequestParam("message") String mess) {
        User temp = this.userService.getUser(user.getId());
        this.userService.handleContact(temp, user, mess);
        return "redirect:/";
    }

    @GetMapping("/access-deny")
    public String showDeny() {
        return "client/auth/deny";
    }

}
