<%@ page import="java.util.*, com.roomsync.entity.Room" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Fetch logged-in owner
    com.roomsync.entity.User owner = (com.roomsync.entity.User) session.getAttribute("user");

    if (owner == null) {
        response.sendRedirect("../../login");
        return;
    }

    // Owner's rooms
    List<Room> roomList = (List<Room>) request.getAttribute("rooms");
    if (roomList == null) roomList = new ArrayList<>();

    int totalRooms = roomList.size();
    int totalWishlist = 0;
    int totalReviews = 0;
    int totalViews = 0;

    for (Room r : roomList) {
        if (r.getWishlists() != null) totalWishlist += r.getWishlists().size();
        if (r.getReviews() != null) totalReviews += r.getReviews().size();
        totalViews += r.getViews(); // assuming field exists
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Owner Dashboard - RoomSync</title>
    <link rel="stylesheet" href="../../assets/css/common.css">

    <style>
        .dashboard-container {
            width: 95%;
            margin: 30px auto;
        }
        .welcome-box {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
            margin-bottom: 25px;
        }
        .metrics {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        .metric-card {
            background: #fff;
            flex: 1;
            min-width: 230px;
            padding: 25px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
        }
        .metric-card h2 {
            margin: 15px 0 5px;
            font-size: 32px;
            color: #222;
        }
        .metric-card p {
            font-size: 14px;
            color: #666;
        }

        .rooms-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }
        .rooms-table th, .rooms-table td {
            padding: 12px;
            border: 1px solid #ddd;
        }
        .rooms-table th {
            background: #f8f8f8;
        }
    </style>
</head>
<body>

<jsp:include page="sidebar.jsp" />

<div class="dashboard-container">
    <div class="welcome-box">
        <h2>Welcome, <%= owner.getFullName() %> 👋</h2>
        <p>Here is an overview of your rooms and performance.</p>
    </div>

    <div class="metrics">
        <div class="metric-card">
            <h2><%= totalRooms %></h2>
            <p>Total Rooms Listed</p>
        </div>

        <div class="metric-card">
            <h2><%= totalWishlist %></h2>
            <p>Total Wishlist Saves</p>
        </div>

        <div class="metric-card">
            <h2><%= totalReviews %></h2>
            <p>Total Reviews</p>
        </div>

        <div class="metric-card">
            <h2><%= totalViews %></h2>
            <p>Total Views</p>
        </div>
    </div>

    <h3 style="margin-top: 40px;">Your Rooms</h3>

    <table class="rooms-table">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>City</th>
            <th>Price</th>
            <th>Views</th>
            <th>Wishlists</th>
            <th>Reviews</th>
        </tr>

        <%
            for (Room r : roomList) {
        %>
        <tr>
            <td><%= r.getId() %></td>
            <td><%= r.getTitle() %></td>
            <td><%= r.getCity() %></td>
            <td>₹ <%= r.getMonthlyRent() %></td>
            <td><%= r.getViews() %></td>
            <td><%= (r.getWishlists() == null ? 0 : r.getWishlists().size()) %></td>
            <td><%= (r.getReviews() == null ? 0 : r.getReviews().size()) %></td>
        </tr>
        <%
            }
        %>
    </table>

</div>

</body>
</html>