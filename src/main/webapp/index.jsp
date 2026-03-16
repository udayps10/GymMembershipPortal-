<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gym Membership Portal</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">
<div class="login-box">

<h1 class="logo">Fitzone</h1>
<p class="subtitle">Login to continue</p>

<%
String error = request.getParameter("error");
if(error != null){
%>
<p style="color:red;">Invalid Email or Password</p>
<%
}
%>

<form action="ServletGym" method="post">
<input type="hidden" name="action" value="login">

<p>Enter your email:</p>
<input type="email" name="email" placeholder="Email" required />

<p>Enter your password:</p>
<input type="password" name="password" placeholder="Password" required />

<br><br>
<button type="submit">Log in</button>

</form>

<p class="signup-text">
Don’t have an account? <a href="register.jsp">Register</a>
</p>

</div>
</div>

</body>
</html>