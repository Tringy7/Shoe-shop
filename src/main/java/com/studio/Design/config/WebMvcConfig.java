package com.studio.Design.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/admin/**")
                .addResourceLocations("/resources/admin/");
        registry.addResourceHandler("/client/**")
                .addResourceLocations("/resources/client/");
        registry.addResourceHandler("/auth/**")
                .addResourceLocations("/resources/auth/");
    }
}
