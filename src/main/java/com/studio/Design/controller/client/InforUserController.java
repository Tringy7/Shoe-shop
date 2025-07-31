package com.studio.Design.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.studio.Design.domain.User;
import com.studio.Design.service.HandleUploadFile;
import com.studio.Design.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class InforUserController {

    private UserService userService;
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
    public String showHistory() {
        return "client/user/history";
    }

}
