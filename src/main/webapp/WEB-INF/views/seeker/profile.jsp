<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.roomsync.entity.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile - RoomSync</title>
    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/components.css">
    <style>
        .profile-card {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .profile-row {
            margin-bottom: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        .label {
            font-weight: 600;
            color: #666;
            display: block;
            margin-bottom: 5px;
        }
        .value {
            font-size: 1.1em;
            color: #333;
        }
        .status-badge {
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.9em;
            background: #e8f5e9;
            color: #2e7d32;
        }
    </style>
</head>
<body>
    <jsp:include page="../components/header.jsp" />

    <div class="container">
        <div class="profile-card">
            <h2 style="margin-bottom: 25px; border-bottom: 2px solid var(--primary); padding-bottom: 10px;">👤 Personal Profile</h2>
            
            <%
                // Retrieve user from session (populated in CustomLoginSuccessHandler)
                User user = (User) session.getAttribute("user");
                if (user != null) {
            %>
                <div class="profile-row">
                    <span class="label">Full Name</span>
                    <span class="value"><%= user.getName() %></span>
                </div>

                <div class="profile-row">
                    <span class="label">Email Address</span>
                    <span class="value"><%= user.getEmail() %></span>
                </div>

                <div class="profile-row">
                    <span class="label">Phone Number</span>
                    <span class="value"><%= user.getPhone() %></span>
                </div>

                <div class="profile-row">
                    <span class="label">Account Role</span>
                    <span class="value"><%= user.getRole().getName() %></span>
                </div>

                <div class="profile-row">
                    <span class="label">Account Status</span>
                    <span class="status-badge"><%= user.getStatus() %></span>
                </div>

                <div style="margin-top: 30px;">
                    <a href="/user/dashboard" class="btn-primary" style="background-color: #6c757d;">Back to Dashboard</a>
                    <a href="/user/profile/edit" class="btn-primary" style="margin-left: 10px;">Edit Profile</a>
                </div>
            <%
                } else {
                    // Redirect to login if session is empty
                    response.sendRedirect("/login");
                }
            %>
        </div>
    </div>

    <jsp:include page="../components/footer.jsp" />
</body>
</html>