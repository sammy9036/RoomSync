<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.roomsync.entity.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Rooms - RoomSync</title>
    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/components.css">
</head>
<body>
    <jsp:include page="../components/header.jsp" />

    <div class="container" style="margin-top: 20px;">
        <h2>Available Rooms</h2>
        <table border="1" width="100%" cellpadding="10" style="border-collapse: collapse;">
            <thead>
                <tr style="background-color: #f4f4f4;">
                    <th>Title</th>
                    <th>Rent</th>
                    <th>Type</th>
                    <th>Sharing</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<Room> rooms = (List<Room>) request.getAttribute("rooms");
                if (rooms != null && !rooms.isEmpty()) {
                    Iterator<Room> it = rooms.iterator();
                    while (it.hasNext()) {
                        Room r = it.next();
            %>
                <tr>
                    <td><%= r.getTitle() %></td>
                    <td>₹<%= r.getRent() %></td>
                    <td><%= r.getType() %></td>
                    <td><%= r.getSharing() %></td>
                    <td>
                        <a href="/user/rooms/view/<%= r.getId() %>" class="btn-primary">View Details</a>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="5" style="text-align:center;">No rooms are currently available.</td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <jsp:include page="../components/footer.jsp" />
</body>
</html>