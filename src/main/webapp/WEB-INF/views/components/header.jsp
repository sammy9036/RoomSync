<%@ page import="com.roomsync.entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<header class="main-header">

    <div class="header-container">

        <!-- LOGO -->
        <div class="logo">
            <a href="/" style="font-size:20px; font-weight:600;">RoomSync</a>
        </div>

        <!-- NAVIGATION -->
        <nav class="nav-menu">
            <a href="/rooms">Explore</a>
            <a href="/owner/dashboard">List Property</a>
            <a href="/chat">Chat</a>
        </nav>

        <!-- RIGHT SECTION -->
        <div class="header-right">

            <!-- SEARCH -->
            <form action="/rooms" method="get" class="search-box">
                <input type="text" name="location" placeholder="Search rooms..." class="input">
            </form>

            <!-- USER / AUTH -->
            <%
                User user = (User) session.getAttribute("user");

                if (user != null) {
            %>
                <div class="user-menu">
                    <span>Hi, <%= user.getName() %></span>
                    <a href="/logout" class="logout">Logout</a>
                </div>
            <%
                } else {
            %>
                <div class="auth-links">
                    <a href="/login">Login</a>
                    <a href="/register" class="btn-primary">Register</a>
                </div>
            <%
                }
            %>

        </div>

    </div>

</header>

</body>
</html>