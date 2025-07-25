package com.studio.Design.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
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
}
