<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.roomsync.security.CustomUserDetails" %>
<%@ page import="com.roomsync.entity.User" %>

<%
    // Authenticated user
    CustomUserDetails cud = (CustomUserDetails)
        SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    User user = cud.getUser();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Seeker Dashboard</title>

    <link rel="stylesheet" href="/static/css/common.css">
    <link rel="stylesheet" href="/static/css/seeker_home.css">
</head>

<body>

<div class="container">

    <!-- Dashboard Greeting -->
    <h1>Welcome, <%= user.getName() %> 👋</h1>

    <p class="subtitle">Find your perfect room easily with RoomSync</p>

    <!-- Quick Actions -->
    <div class="dashboard-grid">

        <a href="/user/rooms/search" class="card">
            <h3>🔍 Search Rooms</h3>
            <p>Browse all available rooms</p>
        </a>

        <a href="/user/profile" class="card">
            <h3>👤 My Profile</h3>
            <p>View or update your details</p>
        </a>

        <a href="/logout" class="card danger">
            <h3>🚪 Logout</h3>
            <p>End your session safely</p>
        </a>

    </div>

</div>

</body>
</html>