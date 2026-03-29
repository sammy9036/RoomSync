package com.roomsync.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {

    @GetMapping("/admin/dashboard")
    public String adminDashboard() {
        return "admin/dashboard";
    }

    @GetMapping("/owner/dashboard")
    public String ownerDashboard() {
        return "owner/dashboard";
    }

    @GetMapping("/user/dashboard")
    public String userDashboard() {
        return "user/dashboard";
    }
    
    @GetMapping("/user/profile")
    public String userProfile() {
        return "user/profile";
    }

}
