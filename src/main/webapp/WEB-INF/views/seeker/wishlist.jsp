<%@ page import="java.util.*, com.roomsync.entity.Room" %>

<%
    List<Room> wishlist = (List<Room>) request.getAttribute("wishlist");
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Wishlist</title>

    <style>
        body { font-family: Arial; background: #f2f2f2; }
        h2 { text-align: center; margin-top: 20px; }

        .room-card {
            width: 80%;
            margin: 15px auto;
            background: white;
            padding: 15px;
            border-radius: 6px;
            box-shadow: 0 0 8px rgba(0,0,0,0.07);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .details { width: 70%; }

        .title { font-size: 18px; font-weight: bold; margin-bottom: 6px; }
        .meta { color: #555; margin-bottom: 4px; }

        .btn-remove {
            background: #dc3545;
            color: #fff;
            padding: 8px 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-remove:hover { background: #bb2d3b; }

        .empty {
            text-align: center;
            padding: 40px;
            font-size: 18px;
            color: #666;
        }
    </style>

</head>
<body>

<h2>My Wishlist</h2>

<%
    if (wishlist == null || wishlist.size() == 0) {
%>
        <div class="empty">Your wishlist is empty.</div>
<%
    } else {
        for (Room room : wishlist) {
%>

    <div class="room-card">
        <div class="details">
            <div class="title"><%= room.getTitle() %></div>

            <div class="meta">
                <b>Rent:</b> ₹<%= room.getRent() %>
            </div>

            <div class="meta">
                <b>Type:</b> <%= room.getType() %> | <b>Sharing:</b> <%= room.getSharing() %>
            </div>

            <div class="meta">
                <b>Area:</b> <%= room.getArea().getName() %>
            </div>

            <div class="meta">
                <b>Owner:</b> <%= room.getOwner().getName() %>
            </div>
        </div>

        <div>
            <form action="/user/wishlist/remove" method="post">
                <input type="hidden" name="roomId" value="<%= room.getId() %>">
                <button class="btn-remove">Remove</button>
            </form>
        </div>
    </div>

<%
        }
    }
%>

</body>
</html>