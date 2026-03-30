<%@ page import="com.roomsync.entity.User" %>

<%
    User user = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>

    <style>
        body { font-family: Arial; background: #f4f4f4; }
        .box {
            width: 45%; margin: 40px auto;
            background: #fff; padding: 20px;
            border-radius: 6px; box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }
        .form-group { margin-bottom: 15px; }
        label { font-weight: bold; margin-bottom: 5px; display: block; }
        input { width: 100%; padding: 8px; border: 1px solid #aaa; border-radius: 4px; }
        .btn {
            margin-top: 15px; padding: 12px 18px;
            background: #0d6efd; color: white; border: none;
            cursor: pointer; border-radius: 4px; width: 100%;
        }
        .btn:hover { background: #0b5ed7; }

    </style>
</head>

<body>

<div class="box">

    <h2>Edit Profile</h2>

    <form action="/user/profile/update" method="post">

        <input type="hidden" name="id" value="<%= user.getId() %>">

        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" value="<%= user.getName() %>" required>
        </div>

        <div class="form-group">
            <label>Email (readonly)</label>
            <input type="email" value="<%= user.getEmail() %>" readonly>
        </div>

        <div class="form-group">
            <label>Phone</label>
            <input type="text" name="phone" value="<%= user.getPhone() %>" required>
        </div>

        <div class="form-group">
            <label>New Password (optional)</label>
            <input type="password" name="password">
        </div>

        <button class="btn">Update Profile</button>

    </form>

</div>

</body>
</html>