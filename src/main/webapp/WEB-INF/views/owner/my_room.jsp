<%@ page import="java.util.*, com.roomsync.entity.Room" %>
<%@ page import="com.roomsync.entity.Area" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Rooms</title>

    <style>
        body { font-family: Arial; background:#f4f4f4; }
        h2 { text-align:center; margin-top:20px; }

        .btn {
            padding: 6px 12px;
            background: #0d6efd;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 5px;
        }
        .delete {
            background: #dc3545;
        }

        table {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
        }
        th { background: #eee; }
    </style>
</head>

<body>

<h2>Your Posted Rooms</h2>

<%
    List<Room> rooms = (List<Room>) request.getAttribute("rooms");

    if (rooms == null || rooms.isEmpty()) {
%>

<p style="text-align:center; font-size:16px; margin-top:30px;">
    You have not added any rooms yet.
</p>

<%
    } else {
%>

<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Rent</th>
        <th>Type</th>
        <th>Sharing</th>
        <th>Area</th>
        <th>Created At</th>
        <th>Actions</th>
    </tr>

<%
        for (Room room : rooms) {
            Area area = room.getArea();
%>

    <tr>
        <td><%= room.getId() %></td>
        <td><%= room.getTitle() %></td>
        <td>₹<%= room.getRent() %></td>
        <td><%= room.getType() %></td>
        <td><%= room.getSharing() %></td>
        <td><%= area != null ? area.getName() : "N/A" %></td>
        <td><%= room.getCreatedAt() != null ? room.getCreatedAt() : "-" %></td>

        <td>
            <a class="btn" href="/owner/rooms/edit/<%= room.getId() %>">Edit</a>

            <a class="btn delete"
               href="/owner/rooms/delete/<%= room.getId() %>"
               onclick="return confirm('Are you sure you want to delete this room?');">
                Delete
            </a>
        </td>
    </tr>

<%
        }
%>

</table>

<%
    }
%>

</body>
</html>