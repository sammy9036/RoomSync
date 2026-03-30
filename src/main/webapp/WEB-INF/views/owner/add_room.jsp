<%@ page import="java.util.*, com.roomsync.entity.Area" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Room</title>

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
            background: #0d6efd;
            color: white;
            padding: 10px 18px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .btn:hover { background: #0b5ed7; }
    </style>
</head>

<body>

<h2>Add New Room</h2>

<div class="form-container">

<form action="/owner/rooms/add" method="post">

    <!-- Title -->
    <div class="form-group">
        <label>Room Title</label>
        <input type="text" name="title" required>
    </div>

    <!-- Rent -->
    <div class="form-group">
        <label>Rent (₹)</label>
        <input type="number" name="rent" required>
    </div>

    <!-- Type -->
    <div class="form-group">
        <label>Type</label>
        <select name="type" required>
            <option value="">Select</option>
            <option value="PG">PG</option>
            <option value="ROOM">Room</option>
            <option value="FLAT">Flat</option>
        </select>
    </div>

    <!-- Sharing -->
    <div class="form-group">
        <label>Sharing</label>
        <select name="sharing" required>
            <option value="">Select</option>
            <option value="SINGLE">Single</option>
            <option value="SHARED">Shared</option>
        </select>
    </div>

    <!-- Area Dropdown -->
    <div class="form-group">
        <label>Area</label>

        <select name="area.id" required>
            <option value="">Select Area</option>

<%
    List<Area> areas = (List<Area>) request.getAttribute("areas");
    if (areas != null) {
        for (Area a : areas) {
%>
            <option value="<%= a.getId() %>"><%= a.getName() %></option>
<%
        }
    }
%>

        </select>
    </div>

    <!-- Description -->
    <div class="form-group">
        <label>Description</label>
        <textarea name="description"></textarea>
    </div>

    <!-- Submit Button -->
    <button type="submit" class="btn">Add Room</button>

</form>

</div>

</body>
</html>