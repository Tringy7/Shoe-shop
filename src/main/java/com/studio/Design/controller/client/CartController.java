package com.studio.Design.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.studio.Design.domain.Cart;
import com.studio.Design.domain.CartDetail;
import com.studio.Design.domain.Order;
import com.studio.Design.domain.User;
import com.studio.Design.service.CartDetailService;
import com.studio.Design.service.CartService;
import com.studio.Design.service.OrderService;
import com.studio.Design.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class CartController {

    private UserService userService;
    private CartService cartService;
    private CartDetailService cartDetailService;
    private OrderService orderService;

    @GetMapping("/cart")
    public String showCart(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Long id = (Long) session.getAttribute("id");
        User user = this.userService.getUser(id);
        Cart cart = new Cart();
        if (user != null) {
            cart = this.cartService.getCartByUser(user);
        }
        if (cart == null) {
            cart = new Cart();
        }
        List<CartDetail> cartDetails = new ArrayList<>();
        if (cart != null && cart.getCartDetails() != null) {
            cartDetails = cart.getCartDetails();
        }
        double totalPrice = 0L;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
        }
        cart.setUser(user);
        cart.setTotalPrice(totalPrice);
        this.cartService.saveCart(cart);
        model.addAttribute("cartDetail", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);
        return "client/cart/show";
    }

    @PostMapping("/cart")
    public String handleCartToOrder(@ModelAttribute("cart") Cart cart, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Long id = (Long) session.getAttribute("id");
        User user = this.userService.getUser(id);
        this.cartDetailService.handleSaveCart(cart, user);
        return "redirect:/checkout";
    }

    @PostMapping("/cart/delete/{id}")
    public String handleDeleteCartDetail(@PathVariable("id") Long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.cartDetailService.handleDeleteCartDetail(id, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String showCheckOut(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Long id = (Long) session.getAttribute("id");
        User user = this.userService.getUser(id);
        Cart cart = new Cart();
        double temp = 0;
        if (user != null) {
            cart = this.cartService.getCartByUser(user);
            temp = cart.getTotalPrice();
        }
        Order order = new Order();
        order.setPaymentMethod("bank");
        model.addAttribute("cart", cart);
        model.addAttribute("totalPrice", temp);
        model.addAttribute("order", order);
        return "client/cart/checkout";
    }

    @PostMapping("/checkout")
    public String handleCheckOut(@ModelAttribute("order") Order order, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Long id = (Long) session.getAttribute("id");
        User user = this.userService.getUser(id);
        this.orderService.handleOrder(order, user, session);
        return "redirect:/complete";
    }

    @GetMapping("/complete")
    public String showComplete(Model model) {

        return "client/cart/complete";
    }

}
