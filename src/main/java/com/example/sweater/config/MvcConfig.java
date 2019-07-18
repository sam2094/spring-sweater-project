package com.example.sweater.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {
    @Value("${upload.path}") //выдергивает из проперти файла переменную uploadPath
    private String uploadPath;

    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("login");
    }


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/img/**") // запрос по адресу "img/" будет перенаправляться // по пути на строчке ниже
                .addResourceLocations("file:///" + uploadPath + "/");
        registry.addResourceHandler("/static/**") // раздача статического css (или чего то другого) раздается тоже без авторизации
                .addResourceLocations("classpath:/static/"); // поиск происходит от корня проекта
    }
}
