<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.roomsync.entity.User" %>
<%@ page import="com.roomsync.entity.Room" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seeker Dashboard - RoomSync</title>
    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/components.css">
</head>
<body>
    <jsp:include page="../components/header.jsp" />

    <div class="container" style="margin-top: 30px;">
        <%
            // Accessing the user from the session set by CustomLoginSuccessHandler
            User currentUser = (User) session.getAttribute("user");
            String name = (currentUser != null) ? currentUser.getName() : "Guest";
        %>
        
        <header style="margin-bottom: 20px;">
            <h1>Welcome back, <%= name %>!</h1>
            <p class="text-secondary">Manage your search and view potential homes here.</p>
        </header>

        <hr style="border: 0; border-top: 1px solid var(--border); margin: 20px 0;">

        <div class="grid grid-3">
            <div class="card" style="padding: 20px; text-align: center;">
                <h3 style="color: var(--primary);">Explore</h3>
                <p>Find your next stay</p>
                <br>
                <a href="/user/rooms/search" class="btn-primary">Browse All Rooms</a>
            </div>

            <div class="card" style="padding: 20px; text-align: center;">
                <h3>My Profile</h3>
                <p>Keep your info updated</p>
                <br>
                <a href="/user/profile" class="btn-primary" style="background: var(--text-secondary);">View Profile</a>
            </div>

            <div class="card" style="padding: 20px; text-align: center;">
                <h3>Messages</h3>
                <p>Connect with owners</p>
                <br>
                <a href="/chat" class="btn-primary" style="background: var(--text-secondary);">Open Inbox</a>
            </div>
        </div>

        <div style="margin-top: 40px;">
            <h3>Getting Started</h3>
            <ul style="margin-top: 10px; line-height: 2;">
                <li><strong>Search:</strong> Use the "Explore" link to filter rooms by area and rent.</li>
                <li><strong>Chat:</strong> Once you find a room, you can chat directly with the owner.</li>
                <li><strong>Review:</strong> Share your experience by leaving reviews on rooms you've visited.</li>
            </ul>
        </div>
    </div>

    <jsp:include page="../components/footer.jsp" />
</body>
</html>