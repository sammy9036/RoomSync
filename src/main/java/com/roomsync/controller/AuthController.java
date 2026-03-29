package com.roomsync.controller;

import com.roomsync.entity.Role;
import com.roomsync.entity.User;
import com.roomsync.service.RoleService;
import com.roomsync.service.UserService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    private final UserService userService;
    private final RoleService roleService;
    private final PasswordEncoder passwordEncoder;

    public AuthController(UserService userService, RoleService roleService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.roleService = roleService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String processRegister(
            @ModelAttribute("user") User user,
            @RequestParam("roleName") String roleName
    ) {

        // Encrypt password
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        // Set role
        Role role = roleService.findByName(roleName)
                .orElseThrow(() -> new RuntimeException("Role not found"));
        user.setRole(role);

        // Set default values
        user.setStatus("ACTIVE");
        user.setVerified(true);

        userService.save(user);

        return "redirect:/login";
    }

    @GetMapping("/dashboard")
    public String dashboard() {
        return "dashboard";
    }
}
