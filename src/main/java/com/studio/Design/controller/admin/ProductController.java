package com.studio.Design.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.studio.Design.domain.Product;
import com.studio.Design.service.HandleUploadFile;
import com.studio.Design.service.ProductService;

import jakarta.validation.Valid;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ProductController {

    private ProductService productService;
    private HandleUploadFile handleUploadFile;

    @GetMapping("/admin/product")
    public String showProduct(Model model) {
        model.addAttribute("productList", this.productService.getAllProduct());
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String showProductCreate(Model model) {
        model.addAttribute("product", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String handleProductCreate(@ModelAttribute("product") @Valid Product product, BindingResult productBindingResult, @RequestParam("avatarFile") MultipartFile file) {
        if (productBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
            product.setImage(handleUploadFile.uploadFile(file, "product"));
        }
        this.productService.createProduct(product);
        return "redirect:/admin/product ";
    }

    @GetMapping("/admin/product/update/{id}")
    public String showProductUpdate(Model model, @PathVariable("id") Long id) {
        model.addAttribute("product", this.productService.getProduct(id));
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update/{id}")
    public String handleProductUpdate(@ModelAttribute("product") @Valid Product product, BindingResult productBindingResult, @RequestParam("avatarFile") MultipartFile file) {

        if (productBindingResult.hasErrors()) {
            return "admin/product/update";
        }

        if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
            product.setImage(handleUploadFile.uploadFile(file, "product"));
        }

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String showProductDelete(@PathVariable("id") Long id, Model model) {
        model.addAttribute("product", this.productService.getProduct(id));
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete/{id}")
    public String handleProductDelete(@PathVariable("id") Long id) {
        this.productService.deleteProduct(id);
        return "redirect:/admin/product";
    }

}
