package com.roomsync.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/admin/dashboard")
    public String adminDashboard() {
        // Points to src/main/webapp/WEB-INF/views/admin/dashboard.jsp
        return "admin/dashboard"; 
    }

    @GetMapping("/owner/dashboard")
    public String ownerDashboard() {
        // Points to src/main/webapp/WEB-INF/views/owner/dashboard.jsp
        return "owner/dashboard";
    }

    @GetMapping("/user/dashboard")
    public String userDashboard() {
        // Points to src/main/webapp/WEB-INF/views/seeker/home.jsp
        return "seeker/home";
    }
    
    @GetMapping("/user/profile")
    public String userProfile() {
        // Points to src/main/webapp/WEB-INF/views/seeker/profile.jsp
        return "seeker/profile";
    }
}