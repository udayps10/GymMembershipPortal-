<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%
    String msg = request.getParameter("msg");
    if("deleted".equals(msg)) {
%>
    <p style="color: green; text-align: center; font-weight: bold;">Member deleted successfully!</p>
<%
    }
    String error = request.getParameter("error");
    if("delete_failed".equals(error)) {
%>
    <p style="color: red; text-align: center; font-weight: bold;">Error: Could not delete member.</p>
<%
    }
%>
<%
    
    if(session.getAttribute("admin") == null && session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    UserDAO dao = new UserDAO();
    List<User> list = dao.getAllUsers();
%>

<!DOCTYPE html>
<html>
<head>
<title>Gym Members</title>
<link rel="stylesheet" href="css/style.css">

<style>

body{
    font-family: Arial, Helvetica, sans-serif;
    background:#f4f4f4;
}

.container{
    width:90%;
    margin:50px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}

.title{
    text-align:center;
    margin-bottom:25px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#111;
    color:white;
    padding:12px;
}

td{
    padding:10px;
    border-bottom:1px solid #ddd;
    text-align:center;
}

tr:hover{
    background:#f9f9f9;
}

.btn-edit{
    color:#2196F3;
    text-decoration:none;
    font-weight:bold;
}

.btn-delete{
    color:#f44336;
    text-decoration:none;
    font-weight:bold;
}

.back-link{
    text-align:center;
    margin-top:30px;
}

.back-link a{
    text-decoration:none;
    color:#555;
    font-weight:bold;
}

.back-link a:hover{
    color:black;
}

</style>
</head>

<body>

<div class="container">

<h2 class="title">Gym Members</h2>

<table>

<thead>
<tr>
<th>ID</th>
<th>Name</th>
<th>Age</th>
<th>Gender</th>
<th>Weight</th>
<th>Height</th>
<th>Email</th>
<th>Trainer</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<%
if(list != null && !list.isEmpty()){
    for(User member : list){
%>

<tr>

<td><%= member.getId() %></td>
<td><%= member.getName() %></td>
<td><%= member.getAge() %></td>
<td><%= member.getGender() %></td>
<td><%= member.getWeight() %> kg</td>
<td><%= member.getHeight() %> cm</td>
<td><%= member.getEmail() %></td>
<td><%= (member.getTrainer()!=null)?member.getTrainer():"None" %></td>

<td>
<a href="editMember.jsp?id=<%= member.getId() %>" class="btn-edit">Edit</a> |
<a href="ServletGym?action=delete&id=<%= member.getId() %>"
class="btn-delete"
onclick="return confirm('Are you sure you want to delete this member?')">
Delete
</a>
</td>

</tr>

<%
    }
}else{
%>

<tr>
<td colspan="9">No members found in the database.</td>
</tr>

<%
}
%>

</tbody>

</table>

<div class="back-link">
<a href="dashboard.jsp">← Back to Dashboard</a>
</div>

</div>

</body>
</html>