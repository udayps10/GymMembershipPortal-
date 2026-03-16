<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
<title>Register</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">
<div class="login-box">

<h1 class="logo">Fitzone</h1>

<form action="ServletGym" method="post">
<input type="hidden" name="action" value="register">

<p>Enter your name:</p>
<input type="text" name="name" placeholder="Name" required>

<p>Enter your age:</p>
<input type="number" name="age" min="1" required>

<p>Gender:</p>
<div class="gender-group">
<label>
<input type="radio" name="gender" value="Male" required> Male
</label>

<label>
<input type="radio" name="gender" value="Female"> Female
</label>

<label>
<input type="radio" name="gender" value="Other"> Other
</label>
</div>

<p>Enter your weight (kg):</p>
<input type="number" name="weight" min="1" required>

<p>Enter your height (cm):</p>
<input type="number" name="height" min="1" required>

<p>Enter your email:</p>
<input type="email" name="email" required>

<p>Create Password:</p>
<input type="password" name="password" required>

<br><br>
<button type="submit">Register</button>

</form>

<p class="signup-text">
Already have an account?
<a href="index.jsp">Log in</a>
</p>

</div>
</div>

</body>
</html>