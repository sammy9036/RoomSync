<%@ page import="java.util.*, com.roomsync.entity.Room" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Owner Dashboard</title>

    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/components.css">
</head>

<body>

<%@ include file="../components/header.jsp" %>

<div class="container">

    <!-- TITLE -->
    <div class="page-header">
        <h2>Dashboard</h2>
        <p>Overview of your property business</p>
    </div>

    <!-- STATS -->
    <div class="grid grid-3">

        <div class="card stat-card">
            <h3>Total Rooms</h3>
            <p><%= request.getAttribute("totalRooms") %></p>
        </div>

        <div class="card stat-card">
            <h3>Bookings</h3>
            <p><%= request.getAttribute("activeBookings") %></p>
        </div>

        <div class="card stat-card">
            <h3>Earnings</h3>
            <p>₹ <%= request.getAttribute("totalEarnings") %></p>
        </div>

    </div>

    <!-- ACTIONS -->
    <div class="section">
        <h3>Quick Actions</h3>

        <div class="action-buttons">
            <a href="/owner/add-room" class="btn-primary">Add Room</a>
            <a href="/owner/my-rooms" class="btn-primary">My Rooms</a>
            <a href="/owner/booking-requests" class="btn-primary">Requests</a>
        </div>
    </div>

    <!-- RECENT ROOMS -->
    <div class="section">
        <h3>Recent Rooms</h3>

        <div class="grid grid-3">

            <%
                List<Room> rooms = (List<Room>) request.getAttribute("recentRooms");

                if (rooms != null) {
                    for (Room room : rooms) {
            %>

            <div class="card room-card">
                <div class="room-img">
                    <img src="<%= room.getImageUrl() %>">
                </div>

                <div class="room-body">
                    <h3><%= room.getTitle() %></h3>
                    <p><%= room.getLocation() %></p>
                    <p class="room-price">₹ <%= room.getPrice() %></p>

                    <a href="/owner/edit-room/<%= room.getId() %>" class="btn-primary">
                        Edit
                    </a>
                </div>
            </div>

            <%
                    }
                }
            %>

        </div>
    </div>

</div>

<%@ include file="../components/footer.jsp" %>

<script src="/js/main.js"></script>

</body>
</html>