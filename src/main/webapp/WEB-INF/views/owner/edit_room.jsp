<%@ page import="java.util.*, com.roomsync.entity.Room, com.roomsync.entity.Area" %>

<%
    Room room = (Room) request.getAttribute("room");
    List<Area> areas = (List<Area>) request.getAttribute("areas");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Room</title>

    <style>
        body { font-family: Arial; background: #f4f4f4; }
        h2 { text-align: center; margin-top: 20px; }

        .form-container {
            width: 60%;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }

        .form-group { margin-bottom: 15px; }
        label { font-weight: bold; display: block; margin-bottom: 5px; }

        input, select, textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #aaa;
            border-radius: 4px;
        }

        textarea { height: 120px; resize: vertical; }

        .btn {
            background: #198754;
            color: white;
            padding: 10px 18px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .btn:hover { background: #157347; }

    </style>
</head>

<body>

<h2>Edit Room</h2>

<div class="form-container">

<form action="/owner/rooms/edit" method="post">

    <!-- Hidden ID -->
    <input type="hidden" name="id" value="<%= room.getId() %>">

    <!-- Title -->
    <div class="form-group">
        <label>Room Title</label>
        <input type="text" name="title" value="<%= room.getTitle() %>" required>
    </div>

    <!-- Rent -->
    <div class="form-group">
        <label>Rent (₹)</label>
        <input type="number" name="rent" value="<%= room.getRent() %>" required>
    </div>

    <!-- Type -->
    <div class="form-group">
        <label>Type</label>
        <select name="type" required>
            <option value="">Select</option>
            <option value="PG" <%= room.getType().equals("PG") ? "selected" : "" %>>PG</option>
            <option value="ROOM" <%= room.getType().equals("ROOM") ? "selected" : "" %>>Room</option>
            <option value="FLAT" <%= room.getType().equals("FLAT") ? "selected" : "" %>>Flat</option>
        </select>
    </div>

    <!-- Sharing -->
    <div class="form-group">
        <label>Sharing</label>
        <select name="sharing" required>
            <option value="">Select</option>
            <option value="SINGLE" <%= room.getSharing().equals("SINGLE") ? "selected" : "" %>>Single</option>
            <option value="SHARED" <%= room.getSharing().equals("SHARED") ? "selected" : "" %>>Shared</option>
        </select>
    </div>

    <!-- Area -->
    <div class="form-group">
        <label>Area</label>

        <select name="area.id" required>
            <option value="">Select Area</option>

            <%
                if (areas != null) {
                    for (Area a : areas) {
                        String sel = (room.getArea().getId().equals(a.getId())) ? "selected" : "";
            %>
                        <option value="<%= a.getId() %>" <%= sel %>><%= a.getName() %></option>
            <%
                    }
                }
            %>

        </select>
    </div>

    <!-- Description -->
    <div class="form-group">
        <label>Description</label>
        <textarea name="description"><%= room.getDescription() %></textarea>
    </div>

    <button type="submit" class="btn">Update Room</button>

</form>

</div>

</body>
</html>