<%@ page import="java.util.*, com.roomsync.entity.*" %>
<%
    List<Room> rooms = (List<Room>) request.getAttribute("rooms");
    List<City> cities = (List<City>) request.getAttribute("cities");
    List<Area> areas = (List<Area>) request.getAttribute("areas");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Room Listings</title>
    <link rel="stylesheet" href="/css/pages/room_list.css">
</head>

<body>

<jsp:include page="/WEB-INF/views/components/header.jsp" />

<div class="container">

    <!-- ===================== SIDEBAR FILTERS ===================== -->
    <aside class="filters">

        <h3>Filters</h3>

        <!-- City Filter -->
        <label>City</label>
        <select id="citySelect" onchange="loadAreas(this.value)">
            <option value="">Select City</option>
            <% if (cities != null) {
                for (City c : cities) { %>
                    <option value="<%= c.getId() %>"><%= c.getName() %></option>
            <% }} %>
        </select>

        <!-- Area Filter -->
        <label>Area</label>
        <select id="areaSelect">
            <option value="">Select Area</option>
            <% if (areas != null) {
                for (Area a : areas) { %>
                    <option value="<%= a.getId() %>"><%= a.getName() %></option>
            <% }} %>
        </select>

        <!-- Room Type -->
        <label>Room Type</label>
        <select id="typeSelect">
            <option value="">All</option>
            <option value="PG">PG</option>
            <option value="ROOM">Room</option>
            <option value="FLAT">Flat</option>
        </select>

        <!-- Sharing -->
        <label>Sharing</label>
        <select id="sharingSelect">
            <option value="">Any</option>
            <option value="SINGLE">Single</option>
            <option value="SHARED">Shared</option>
        </select>

        <!-- Max Rent -->
        <label>Max Rent</label>
        <input type="number" id="maxRent" placeholder="Enter max rent">

        <button onclick="applyFilters()">Apply Filters</button>
    </aside>

    <!-- ===================== ROOM LIST SECTION ===================== -->
    <section class="room-list">

        <h2>Available Rooms</h2>

        <% if (rooms == null || rooms.isEmpty()) { %>
            <p>No rooms found.</p>

        <% } else { 
            for (Room r : rooms) { %>

            <!-- ===================== ROOM CARD (Airbnb Style) ===================== -->
            <div class="room-card">

                <div class="image-box">
                    <img src="/images/default-room.jpg" alt="Room Image">
                </div>

                <div class="details">

                    <h3><%= r.getTitle() %></h3>

                    <p class="location">
                        <%= r.getArea().getName() %>, 
                        <%= r.getArea().getCity().getName() %>
                    </p>

                    <p class="rent">
                        ₹ <strong><%= r.getRent() %></strong> / month
                    </p>

                    <p class="info">
                        Type: <%= r.getType() %> |
                        Sharing: <%= r.getSharing() %>
                    </p>

                    <p class="desc">
                        <%= r.getDescription().length() > 120 
                            ? r.getDescription().substring(0, 120) + "..." 
                            : r.getDescription() %>
                    </p>

                    <p class="owner">Posted by: <%= r.getOwner().getName() %></p>

                    <a href="/seeker/room/<%= r.getId() %>" class="view-btn">View Details</a>

                </div>

            </div>
        <% }} %>

    </section>
</div>

<script src="/js/pages/main.js"></script>

</body>
</html>