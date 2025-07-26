package com.studio.Design.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
import com.studio.Design.domain.ProductDetail;
import com.studio.Design.domain.Product_;
import com.studio.Design.domain.dto.ProductCriterialDTO;
import com.studio.Design.service.HandleUploadFile;
import com.studio.Design.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ProductController {

    private ProductService productService;
    private HandleUploadFile handleUploadFile;

    @GetMapping("/admin/product")
    public String showProduct(
            Model model,
            ProductCriterialDTO productCriterialDTO,
            HttpServletRequest request
    ) {
        int page = 0;
        try {
            if (productCriterialDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriterialDTO.getPage().get());
            }
        } catch (Exception e) {
        }
        Pageable pageable = PageRequest.of(page, 4);
        if (productCriterialDTO.getSort() != null && productCriterialDTO.getSort().isPresent()) {
            String temp = productCriterialDTO.getSort().get();
            if (temp.equals("tang-dan")) {
                pageable = PageRequest.of(page, 4, Sort.by(Product_.PRICE).ascending());
            } else if (temp.equals("giam-dan")) {
                pageable = PageRequest.of(page, 4, Sort.by(Product_.PRICE).descending());
            }
        }
        Page<Product> ps = this.productService.getPage(pageable, productCriterialDTO);
        List<Product> prodList = ps.getContent().size() > 0 ? ps.getContent() : new ArrayList<>();

        String qs = request.getQueryString();
        if (qs != null) {
            // remove url page
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("productList", prodList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", ps.getTotalPages() - 1);
        model.addAttribute("queryString", qs);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String showProductCreate(Model model) {
        Product product = new Product();

        // Tạo danh sách các size mặc định
        List<ProductDetail> detailList = new ArrayList<>();
        String[] sizes = {"S", "M", "L"};
        for (String size : sizes) {
            ProductDetail detail = new ProductDetail();
            detail.setSize(size);
            detail.setQuantity(0L); // default
            detailList.add(detail);
        }

        product.setProductDetails(detailList);

        model.addAttribute("product", product);
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String handleProductCreate(
            @ModelAttribute("product") @Valid Product product,
            BindingResult productBindingResult,
            @RequestParam("avatarFile") MultipartFile file
    ) {
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
        this.productService.updateProduct(product);
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
