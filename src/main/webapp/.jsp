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

      <form>
        <p>Enter your email: </p><input type="email" id="email" placeholder="Email" />
        <br>
        
        <p> Enter your password: </p><input type="password" id="password" placeholder="Password" />
        <br>
		<button id="loginBtn" onclick="loginUser(event)" disabled>Log in</button>      </form>

    <p class="signup-text">
        Don’t have an account? <a href="register.jsp">Register</a>
      </p>

    </div>
  </div>
  <script src="js/script.js"></script>
</body>
</html>