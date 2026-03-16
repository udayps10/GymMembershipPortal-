<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Invalidate session
    if (session != null) {
        session.invalidate();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container center-box">
    <div class="logout-card">
        <h2>You are Logged Out</h2>
        <p>Thank you for visiting our Gym Management System.</p>
        <a href="login.jsp" class="btn">Login Again</a>
    </div>
</div>

</body>
</html>