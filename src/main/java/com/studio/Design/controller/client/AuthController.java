package com.studio.Design.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.studio.Design.domain.dto.UserDTO;
import com.studio.Design.service.UserService;

import jakarta.validation.Valid;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AuthController {

    private UserService userService;

    @GetMapping("/login")
    public String showLogin() {
        return "client/auth/login";
    }

    @GetMapping("/register")
    public String showRegister(Model model) {
        model.addAttribute("newUser", new UserDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleNewUser(@Valid @ModelAttribute("newUser") UserDTO userDTO, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        this.userService.createNewUser(userDTO);
        return "redirect:/login";
    }
}
