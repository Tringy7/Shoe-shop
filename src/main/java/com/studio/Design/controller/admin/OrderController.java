package com.studio.Design.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.studio.Design.domain.Order;
import com.studio.Design.domain.dto.ProductCriterialDTO;
import com.studio.Design.service.OrderDetailService;
import com.studio.Design.service.OrderService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class OrderController {

    private OrderService orderService;

    @GetMapping("/admin/order")
    public String showOrder(Model model, ProductCriterialDTO productCriterialDTO) {
        int page = 0;
        try {
            if (productCriterialDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriterialDTO.getPage().get());
            }
        } catch (Exception e) {
        }
        Pageable pageable = PageRequest.of(page, 1);

        Page<Order> od = this.orderService.getAllOrder(pageable);

        List<Order> orders = od.getContent().size() > 0 ? od.getContent() : new ArrayList<>();
        model.addAttribute("orderList", orders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", od.getTotalPages() - 1);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String showDeleteOrderDetail(@PathVariable("id") Long id, Model model) {
        model.addAttribute("order", this.orderService.getAOrder(id));
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete/{id}")
    public String handleDeleteOrderDetail(@PathVariable("id") Long id) {
        this.orderService.handleDeleteOrder(id);
        return "redirect:/admin/order";
    }

}
