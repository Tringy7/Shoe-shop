package com.studio.Design.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.studio.Design.domain.Cart;
import com.studio.Design.domain.CartDetail;
import com.studio.Design.domain.User;
import com.studio.Design.service.CartService;
import com.studio.Design.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.studio.Design.service.CartDetailService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@AllArgsConstructor
public class CartController {

    private UserService userService;
    private CartService cartService;
    private CartDetailService cartDetailService;

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

    @PostMapping("/cart/delete/{id}")
    public String handleDeleteCartDetail(@PathVariable("id") Long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.cartDetailService.handleDeleteCartDetail(id, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String showCheckOut(Model model) {
        return "client/cart/checkout";
    }

    @GetMapping("/complete")
    public String showComplete(Model model) {
        return "client/cart/complete";
    }

}
