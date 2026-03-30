<%@ page import="java.util.*, com.roomsync.entity.Room, com.roomsync.entity.Review" %>
<%
    Room room = (Room) request.getAttribute("room");
    List<Review> reviews = (List<Review>) request.getAttribute("reviews");
%>

<!DOCTYPE html>
<html>
<head>
    <title><%= room.getTitle() %> - Room Details</title>
    <link rel="stylesheet" href="/static/css/common.css">
    <link rel="stylesheet" href="/static/css/room_detail.css">
</head>

<body>

<div class="container">

    <!-- ROOM TITLE -->
    <h1><%= room.getTitle() %></h1>

    <!-- LOCATION -->
    <p class="location">
        <%= room.getArea().getName() %>,
        <%= room.getArea().getCity().getName() %>
    </p>

    <!-- PRICE BLOCK -->
    <div class="price-box">
        <h2>₹ <%= room.getRent() %> / month</h2>
        <span class="tag"><%= room.getType() %></span>
        <span class="tag"><%= room.getSharing() %></span>
    </div>

    <!-- IMAGE GALLERY (Placeholder) -->
    <div class="gallery">
        <img src="/static/img/default-room.jpg" class="main-img" alt="Room Image">
    </div>

    <!-- DESCRIPTION -->
    <div class="section">
        <h3>About this room</h3>
        <p><%= room.getDescription() %></p>
    </div>

    <!-- OWNER INFO -->
    <div class="section owner-box">
        <h3>Owner Details</h3>
        <p><strong>Name:</strong> <%= room.getOwner().getName() %></p>
        <p><strong>Phone:</strong> <%= room.getOwner().getPhone() %></p>
        <p><strong>Email:</strong> <%= room.getOwner().getEmail() %></p>
    </div>

    <!-- REVIEWS SECTION -->
    <div class="section">
        <h3>Reviews</h3>

        <% if (reviews != null && reviews.size() > 0) { %>
            <% for (Review r : reviews) { %>
                <div class="review-item">
                    <div class="rating">⭐ <%= r.getRating() %>/5</div>
                    <p><%= r.getComment() %></p>
                    <small>by <%= r.getUser().getName() %></small>
                </div>
            <% } %>
        <% } else { %>
            <p>No reviews yet.</p>
        <% } %>
    </div>

    <!-- ADD REVIEW FORM -->
    <div class="section">
        <h3>Write a Review</h3>

        <form action="/user/rooms/review" method="post">

            <input type="hidden" name="roomId" value="<%= room.getId() %>">

            <label>Rating (1-5)</label>
            <input type="number" name="rating" min="1" max="5" required>

            <label>Comment</label>
            <textarea name="comment" required></textarea>

            <button type="submit">Submit Review</button>
        </form>
    </div>

</div>

</body>
</html>