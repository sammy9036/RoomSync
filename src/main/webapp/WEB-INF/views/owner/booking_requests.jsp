<%@ page import="java.util.*" %>
<%@ page import="com.roomsync.entity.Booking" %>
<%@ page import="com.roomsync.entity.User" %>
<%@ page import="com.roomsync.entity.Room" %>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Requests</title>
</head>
<body>

<h2>Booking Requests Received</h2>

<%
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");

    if (bookings == null || bookings.isEmpty()) {
%>
        <p>No booking requests found.</p>
<%
    } else {
%>

<table border="1" cellpadding="10" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>Room</th>
        <th>Seeker Name</th>
        <th>Seeker Phone</th>
        <th>Date</th>
    </tr>

<%
        for (Booking b : bookings) {
            Room r = b.getRoom();
            User seeker = b.getSeeker();
%>
    <tr>
        <td><%= b.getId() %></td>
        <td><%= r.getTitle() %></td>
        <td><%= seeker.getName() %></td>
        <td><%= seeker.getPhone() %></td>
        <td><%= b.getCreatedAt() %></td>
    </tr>
<%
        }
    }
%>

</table>

</body>
</html>