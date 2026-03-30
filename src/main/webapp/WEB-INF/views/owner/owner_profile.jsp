<%@ page import="com.roomsync.entity.User" %>

<%
    User owner = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Owner Profile</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        .container { max-width: 600px; margin: auto; }
        label { display: block; margin-top: 10px; }
        input[type=text], input[type=email], input[type=tel] {
            width: 100%; padding: 8px; margin-top: 5px;
        }
        button {
            margin-top: 15px;
            padding: 10px 20px;
            background: black; color: white; border: none;
            cursor: pointer;
        }
        h2 { text-align: center; }
    </style>
</head>
<body>

<div class="container">
    <h2>Owner Profile</h2>

    <form action="/owner/update-profile" method="post">

        <input type="hidden" name="id" value="<%= owner.getId() %>" />

        <label>Name</label>
        <input type="text" name="name" value="<%= owner.getName() %>" required>

        <label>Email</label>
        <input type="email" name="email" value="<%= owner.getEmail() %>" readonly>

        <label>Phone</label>
        <input type="tel" name="phone" value="<%= owner.getPhone() %>" required>

        <label>Status</label>
        <input type="text" value="<%= owner.getStatus() %>" disabled>

        <button type="submit">Update Profile</button>	
    </form>

</div>

</body>
</html>