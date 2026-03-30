package com.roomsync.security;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import java.io.IOException;

@Component
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(
            HttpServletRequest request,
            HttpServletResponse response,
            Authentication authentication
    ) throws IOException, ServletException {

        // Get the logged-in user and store in session for JSP Scriptlets
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        HttpSession session = request.getSession();
        session.setAttribute("user", userDetails.getUser());

        String role = authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .findFirst()
                .orElse("");

        if (role.equals("ROLE_ADMIN")) {
            response.sendRedirect("/admin/dashboard");
        } else if (role.equals("ROLE_OWNER")) {
            response.sendRedirect("/owner/dashboard");
        } else if (role.equals("ROLE_SEEKER")) {
            // Update to match seeker path
            response.sendRedirect("/user/dashboard");
        } else {
            response.sendRedirect("/login?error");
        }
    }
}