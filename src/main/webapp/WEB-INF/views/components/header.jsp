<%@ page import="com.roomsync.entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="main-header">
    <div class="header-container">
        <div class="logo"><a href="/">RoomSync</a></div>
        <nav class="nav-menu">
            <a href="/user/rooms/search">Explore</a>
            <a href="/owner/dashboard">List Property</a>
        </nav>
        <div class="header-right">
            <%
                User user = (User) session.getAttribute("user");
                if (user != null) {
            %>
                <div class="user-menu">
                    <span>Hi, <%= user.getName() %></span>
                    <a href="/logout" class="logout">Logout</a>
                </div>
            <% } else { %>
                <div class="auth-links">
                    <a href="/login">Login</a>
                    <a href="/register" class="btn-primary">Register</a>
                </div>
            <% } %>
        </div>
    </div>
</header>