package com.studio.Design.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // registry.addResourceHandler("/css/**")
        //         .addResourceLocations("/resources/css/");
        // registry.addResourceHandler("/js/**")
        //         .addResourceLocations("/resources/js/");
        // registry.addResourceHandler("/images/**")
        //         .addResourceLocations("/resources/images/");
        // registry.addResourceHandler("/client/**")
        //         .addResourceLocations("/resources/client/");
        // registry.addResourceHandler("/error/**")
        //         .addResourceLocations("/resources/error/");
        registry.addResourceHandler("/admin/**")
                .addResourceLocations("/resources/admin/");
    }

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();

        resolver.setMaxUploadSize(524288000); // 500MB tổng cộng
        resolver.setMaxUploadSizePerFile(10485760); // 10MB mỗi file

        // cấu hình fileCountMax
        ServletFileUpload upload = new ServletFileUpload();
        upload.setFileCountMax(50); // ✅ Tăng số file tối đa được upload

        resolver.setFileUpload(upload);
        return resolver;
    }
}
