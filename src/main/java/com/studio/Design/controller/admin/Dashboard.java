package com.studio.Design.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Dashboard {

    @GetMapping("/admin")
    public String showAdmin(Model model) {
        return "admin/dashboard/show";
    }

}
