<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;
}


body{
min-height:100vh;
background:linear-gradient(135deg,#eef2f7,#f9fafb);
padding:50px;
}



.header{
display:flex;
justify-content:space-between;
align-items:center;
width:100%;
margin-bottom:50px;
}

.header h2{
font-size:34px;
font-weight:600;
}

.logout{
text-decoration:none;
background:black;
color:white;
padding:10px 22px;
border-radius:8px;
font-size:14px;
transition:0.25s;
}

.logout:hover{
background:#222;
}


.container{
display:grid;
grid-template-columns:1fr 1fr;
gap:40px;
width:100%;
max-width:1400px;
margin:auto;
}


.card{
background:white;
border-radius:18px;
box-shadow:0 18px 50px rgba(0,0,0,0.08);
overflow:hidden;
transition:0.3s;
min-height:240px;

display:flex;
flex-direction:column;
justify-content:space-between;
}

.card:hover{
transform:translateY(-8px);
box-shadow:0 25px 65px rgba(0,0,0,0.12);
}



.card-header{
background:black;
color:white;
padding:22px 30px;
font-size:22px;
font-weight:600;
letter-spacing:0.3px;
}



.card-body{
padding:30px;
}


.card-body p{
font-family:Georgia,'Times New Roman',serif;
font-size:17px;
color:#555;
line-height:1.6;
margin-bottom:28px;
}



.btn{
display:inline-block;
text-decoration:none;
background:black;
color:white;
padding:12px 22px;
border-radius:8px;
font-size:14px;
transition:0.25s;
}

.btn:hover{
background:#222;
transform:scale(1.05);
}

</style>
</head>

<body>

<div class="header">
<h2> Fitzone Admin Dashboard</h2>
<a href="logout.jsp" class="logout">Logout</a>
</div>

<div class="container">

<div class="card">
<div class="card-header">View Members</div>
<div class="card-body">
<p>See all registered gym members and manage their information.</p>
<a href="viewMembers.jsp" class="btn">Open</a>
</div>
</div>

<div class="card">
<div class="card-header">Add Member</div>
<div class="card-body">
<p>Register new members and add them to the gym system.</p>
<a href="register.jsp" class="btn">Add</a>
</div>
</div>

<div class="card">
<div class="card-header">Trainer Allocation</div>
<div class="card-body">
<p>Assign trainers to members who have chosen premium plans.</p>
<a href="trainers.jsp" class="btn">Manage</a>
</div>
</div>

<div class="card">
<div class="card-header">Subscriptions</div>
<div class="card-body">
<p>View and manage different gym membership plans.</p>
<a href="subscription.jsp" class="btn">View Plans</a>
</div>
</div>

</div>

</body>
</html>