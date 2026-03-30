<%@ page import="com.roomsync.entity.Room, com.roomsync.entity.User" %>

<%
    Room room = (Room) request.getAttribute("room");
    User user = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>

    <style>
        body { font-family: Arial; background: #f4f4f4; }
        .box {
            width: 60%; margin: 30px auto;
            background: #fff; padding: 20px;
            border-radius: 6px; box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }
        h2 { margin-top: 0; text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        td { padding: 10px; border-bottom: 1px solid #ddd; }
        .btn {
            margin-top: 20px; padding: 12px 20px;
            background: #198754; border: none; color: #fff; cursor: pointer;
            border-radius: 4px; display: block; width: 100%;
        }
        .btn:hover { background: #157347; }
    </style>
</head>

<body>

<div class="box">
    <h2>Confirm Your Booking</h2>

    <table>
        <tr>
            <td><b>Room:</b></td>
            <td><%= room.getTitle() %></td>
        </tr>
        <tr>
            <td><b>Rent:</b></td>
            <td>₹ <%= room.getRent() %></td>
        </tr>
        <tr>
            <td><b>Type:</b></td>
            <td><%= room.getType() %> / <%= room.getSharing() %></td>
        </tr>
        <tr>
            <td><b>Area:</b></td>
            <td><%= room.getArea().getName() %></td>
        </tr>
        <tr>
            <td><b>Booked By:</b></td>
            <td><%= user.getName() %> (<%= user.getEmail() %>)</td>
        </tr>
    </table>

    <form action="/user/booking/confirm" method="post">
        <input type="hidden" name="roomId" value="<%= room.getId() %>">

        <button class="btn">Confirm Booking</button>
    </form>
</div>

</body>
</html>