package com.example.sweater.controller;

import com.example.sweater.domain.Role;
import com.example.sweater.domain.User;
import com.example.sweater.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String,Object> model){
        if(!userService.addUser(user)){ // метод возвращает false,если пользователь существует - соответсвенно выводим сообщение
           model.put("message","User exist!");
           return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/activate/{code}") // переходит по ссылке с кодом регистрации
    public String activate(Model model, @PathVariable String code){
        boolean isActivated = userService.activateUser(code);
        if(isActivated){
            model.addAttribute("message","User successfully activated");
        }else{
            model.addAttribute("message","Activation code is not found");
        }
        return "login";
    }
}
