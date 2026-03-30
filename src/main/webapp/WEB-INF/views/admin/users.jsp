<%@ page import="java.util.*" %>
<%@ page import="com.roomsync.entity.User" %>

<%
    List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Users</title>
    <link rel="stylesheet" href="/static/css/common.css">
    <link rel="stylesheet" href="/static/css/admin_users.css">
</head>

<body>

<h1>All Registered Users</h1>

<table border="1" cellpadding="10" cellspacing="0" width="100%">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Role</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>

    <%
        if (users != null) {
            for (User u : users) {
    %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getPhone() %></td>
            <td><%= u.getRole().getName() %></td>
            <td><%= u.getStatus() %></td>

            <td>
                <% if ("ACTIVE".equals(u.getStatus())) { %>
                    <a href="/admin/block/<%= u.getId() %>" class="btn danger">Block</a>
                <% } else { %>
                    <a href="/admin/unblock/<%= u.getId() %>" class="btn success">Unblock</a>
                <% } %>
            </td>
        </tr>
    <%
            }
        }
    %>

</table>

<a href="/admin/dashboard" class="btn">Back to Dashboard</a>

</body>
</html>