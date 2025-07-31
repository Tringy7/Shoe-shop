package com.studio.Design.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.studio.Design.domain.Order;
import com.studio.Design.domain.User;
import com.studio.Design.domain.dto.ProductCriterialDTO;
import com.studio.Design.service.HandleUploadFile;
import com.studio.Design.service.OrderService;
import com.studio.Design.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class InforUserController {

    private UserService userService;
    private OrderService orderService;
    private HandleUploadFile handleUploadFile;

    @GetMapping("/information")
    public String showInfo(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Long id = (Long) session.getAttribute("id");
        User user = this.userService.getUser(id);
        model.addAttribute("user", user);
        return "client/user/information";
    }

    @PostMapping("/information")
    public String handleUserUpdate(HttpServletRequest request,
            @Valid @ModelAttribute("user") User user,
            BindingResult userBindingResult,
            @RequestParam("avatarFile") MultipartFile file) {

        if (userBindingResult.hasErrors()) {
            return "client/user/information";
        }
        if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
            user.setAvatar(handleUploadFile.uploadFile(file, "user"));
        }
        this.userService.updateUser(user);
        return "client/user/information";
    }

    @GetMapping("/history")
    public String showHistory(Model model, HttpServletRequest request, ProductCriterialDTO productCriterialDTO
    ) {
        HttpSession session = request.getSession(false);
        Long id = (Long) session.getAttribute("id");
        User user = this.userService.getUser(id);

        int page = 0;
        try {
            if (productCriterialDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriterialDTO.getPage().get());
            }
        } catch (Exception e) {
        }
        Pageable pageable = PageRequest.of(page, 1);

        Page<Order> od = this.orderService.getOrder(user, pageable);

        List<Order> orders = od.getContent().size() > 0 ? od.getContent() : new ArrayList<>();
        model.addAttribute("orderList", orders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", od.getTotalPages() - 1);
        return "client/user/history";
    }

}
