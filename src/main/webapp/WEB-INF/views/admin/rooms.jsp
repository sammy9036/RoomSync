<%@ page import="java.util.*, com.roomsync.entity.Room" %>
<%@ page import="com.roomsync.entity.Area, com.roomsync.entity.User" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin | All Rooms</title>

    <style>
        body { font-family: Arial; background:#f9f9f9; }
        h2 { text-align:center; margin-top:20px; }

        table { width: 95%; margin: 20px auto; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid #ccc; font-size: 14px; }
        th { background: #eee; }

        a.btn {
            padding: 6px 12px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        a.delete {
            background: #dc3545;
        }
    </style>

</head>
<body>

<h2>All Rooms (Admin)</h2>

<%
    List<Room> rooms = (List<Room>) request.getAttribute("rooms");

    if (rooms == null || rooms.isEmpty()) {
%>

<p style="text-align:center;">No rooms found.</p>

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
        <th>Owner</th>
        <th>Created At</th>
        <th>Actions</th>
    </tr>

<%
        for (Room r : rooms) {
            Area area = r.getArea();
            User owner = r.getOwner();
%>

    <tr>
        <td><%= r.getId() %></td>
        <td><%= r.getTitle() %></td>
        <td>₹<%= r.getRent() %></td>
        <td><%= r.getType() %></td>
        <td><%= r.getSharing() %></td>
        <td><%= area != null ? area.getName() : "N/A" %></td>
        <td><%= owner != null ? owner.getName() : "N/A" %></td>
        <td><%= r.getCreatedAt() != null ? r.getCreatedAt().toString() : "-" %></td>

        <td>
            <a class="btn" href="/admin/rooms/edit/<%= r.getId() %>">Edit</a>

            <a class="btn delete" href="/admin/rooms/delete/<%= r.getId() %>"
               onclick="return confirm('Delete this room?');">
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