package com.example.sweater;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication // аннотация которая автоматически поднимает приложение , находит контроллеры и т.д
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
