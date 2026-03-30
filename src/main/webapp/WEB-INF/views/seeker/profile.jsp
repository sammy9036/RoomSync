<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.roomsync.security.CustomUserDetails" %>
<%@ page import="com.roomsync.entity.User" %>

<%
    // Retrieve logged-in user from Spring Security
    CustomUserDetails cud = (CustomUserDetails)
        SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    User user = cud.getUser();
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Profile</title>

    <link rel="stylesheet" href="/static/css/common.css">
    <link rel="stylesheet" href="/static/css/profile.css">
</head>

<body>

<div class="container">

    <h1>My Profile</h1>

    <div class="profile-card">

        <h2><%= user.getName() %></h2>

        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Phone:</strong> <%= user.getPhone() %></p>
        <p><strong>Role:</strong> <%= user.getRole().getName() %></p>
        <p><strong>Status:</strong> <%= user.getStatus() %></p>

        <p><strong>Verified:</strong>
            <%= user.isVerified() ? "Yes" : "No" %>
        </p>

        <p><strong>Joined On:</strong>
            <%= user.getCreatedAt() != null ? user.getCreatedAt().toString() : "Not Available" %>
        </p>

        <a href="/user/dashboard" class="btn">Back to Dashboard</a>

    </div>

</div>

</body>
</html>