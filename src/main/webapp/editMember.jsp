<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
   
    User u = (User) session.getAttribute("user");


    if (u == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    
    
    String currentGender = (u.getGender() != null) ? u.getGender() : "";
    String currentTrainer = (u.getTrainer() != null) ? u.getTrainer() : "None";
%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Member | Fitzone</title>

<style>

body{
    font-family:'Segoe UI',sans-serif;
    background:#f2f3f7;
    margin:0;
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
}


.container{
    width:420px;
    background:white;
    padding:40px;
    border-radius:12px;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

h2{ text-align:center; margin-bottom:25px; color: #111; }


input, select{
    width: 100%;
    padding: 12px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
    box-sizing: border-box; 
}


button{
    width:100%;
    padding:12px;
    border:none;
    background:#111;
    color:white;
    font-size:16px;
    border-radius:6px;
    cursor:pointer;
    font-weight: 600;
}

button:hover{ background:#333; }

.back-link {
    display: block;
    text-align: center;
    margin-top: 15px;
    color: #666;
    text-decoration: none;
    font-size: 14px;
}
</style>
</head>

<body>

<div class="container">

<h2>Edit Profile</h2>

<form action="ServletGym" method="post">

    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="<%= u.getId() %>">

    <label>Full Name</label>
    <input type="text" name="name" value="<%= u.getName() %>" required>

    <label>Age</label>
    <input type="number" name="age" value="<%= u.getAge() %>" required>

    <label>Gender</label>
    <select name="gender">
        <option value="Male" <%= "Male".equals(currentGender) ? "selected" : "" %>>Male</option>
        <option value="Female" <%= "Female".equals(currentGender) ? "selected" : "" %>>Female</option>
        <option value="Other" <%= "Other".equals(currentGender) ? "selected" : "" %>>Other</option>
    </select>

    <label>Weight (kg)</label>
    <input type="text" name="weight" value="<%= u.getWeight() %>">

    <label>Height (cm)</label>
    <input type="text" name="height" value="<%= u.getHeight() %>">

    <label>Email Address</label>
    <input type="email" name="email" value="<%= u.getEmail() %>" required>

    <input type="hidden" name="trainer" value="<%= currentTrainer %>">

    <button type="submit">Save Changes</button>
    <a href="dashboard.jsp" class="back-link">Cancel</a>

</form>

</div>

</body>
</html>