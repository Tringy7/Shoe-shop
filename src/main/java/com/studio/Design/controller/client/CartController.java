package com.studio.Design.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.studio.Design.domain.Cart;
import com.studio.Design.domain.CartDetail;
import com.studio.Design.domain.User;
import com.studio.Design.service.CartService;
import com.studio.Design.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class CartController {

    private UserService userService;
    private CartService cartService;

    @GetMapping("/cart")
    public String showCart(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Long id = (Long) session.getAttribute("id");
        User user = this.userService.getUser(id);
        Cart cart = new Cart();
        if (user != null) {
            cart = this.cartService.getCartByUser(user);
        }
        List<CartDetail> cartDetails = cart.getCartDetails() != null ? cart.getCartDetails() : new ArrayList<CartDetail>();
        double totalPrice = 0L;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
        }
        model.addAttribute("cartDetail", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/show";
    }
}
