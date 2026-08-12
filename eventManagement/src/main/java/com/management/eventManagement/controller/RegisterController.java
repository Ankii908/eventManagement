package com.management.eventManagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.management.eventManagement.entity.User;
import com.management.eventManagement.service.UserService;


@Controller
public class RegisterController {

    @Autowired
    private UserService service;

    @GetMapping("/register")
    public String registerPage(Model model) {

        model.addAttribute("user", new User());

        return "register";
    }

    @PostMapping("/saveUser")
    public String saveUser(@ModelAttribute User user, RedirectAttributes redirectAttribute) {
    	
        service.saveUser(user);
        if(user.getUsername() == null) {
        	redirectAttribute.addFlashAttribute( "erroe","Duplicate Username.");
             return "redirect:/register";
    	}else if(user.getEmail().isEmpty()) {
    		redirectAttribute.addFlashAttribute( "erroe","Duplicate email.");
            return "redirect:/register";
    	}
        return "redirect:/login"; 
    }
}
