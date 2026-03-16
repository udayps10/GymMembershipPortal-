<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Choose Plan</title>
<link rel="stylesheet" href="css/style.css">

<style>

body{
min-height:100vh;
margin:0;
display:flex;
justify-content:center;
align-items:center;
font-family:Arial, sans-serif;
background:linear-gradient(270deg,#0a0a0a,#1a1a1a,#000);
background-size:600% 600%;
animation:backgroundMove 12s ease infinite;
}



@keyframes backgroundMove{
0%{background-position:0% 50%;}
50%{background-position:100% 50%;}
100%{background-position:0% 50%;}
}



.container{
width:100%;
max-width:1400px;
padding:40px;
display:flex;
justify-content:center;
align-items:center;
}


.plan-row{
display:flex;
justify-content:center;
align-items:stretch;
gap:60px;
flex-wrap:wrap;
}

.plan-card{
background:white;
width:380px;
padding:55px 40px;
border-radius:25px;
box-shadow:0 25px 80px rgba(0,0,0,0.45);
text-align:center;
transition:0.4s;
position:relative;
}


.plan-card:hover{
transform:translateY(-15px) scale(1.06);
box-shadow:0 40px 100px rgba(0,0,0,0.6);
}



.popular{
transform:scale(1.12);
box-shadow:0 40px 120px rgba(0,0,0,0.7);
}



.plan-card h3{
font-size:32px;
margin-bottom:10px;
}



.plan-card p{
font-size:22px;
font-weight:bold;
margin-bottom:25px;
}


.plan-card ul{
list-style:disc;
text-align:left;
margin:30px 0;
padding-left:25px;
font-size:17px;
}

.plan-card ul li{
margin:12px 0;
color:#444;
}


.btn{
width:100%;
padding:16px;
border:none;
border-radius:12px;
background:black;
color:white;
font-size:17px;
cursor:pointer;
transition:0.3s;
font-weight:bold;
}

.btn:hover{
background:#222;
transform:scale(1.05);
}

@media(max-width:900px){

.plan-row{
flex-direction:column;
align-items:center;
}

.plan-card{
width:90%;
}

.popular{
transform:scale(1.05);
}

}

</style>
</head>

<body>

<div class="container">

<div class="plan-row">


<div class="plan-card">
<h3>Basic</h3>
<p>₹999 / 6 months</p>

<ul>
<li>Gym Entry Access</li>
<li>Use of Equipment</li>
<li>Standard Support</li>
</ul>

<form action="ServletGym" method="post">
<input type="hidden" name="action" value="upgradePlan">
<input type="hidden" name="planName" value="Basic">

<button type="submit" class="btn">
Choose Basic
</button>

</form>
</div>


<div class="plan-card popular">

<h3>Pro</h3>
<p>₹1999 / 6 months</p>

<ul>
<li>All Basic Features</li>
<li>Free Gym Bag</li>
<li>Locker Facility</li>
</ul>

<form action="ServletGym" method="post">
<input type="hidden" name="action" value="upgradePlan">
<input type="hidden" name="planName" value="Pro">

<button type="submit" class="btn">
Choose Pro
</button>

</form>

</div>



<div class="plan-card">

<h3>Elite</h3>
<p>₹2999 / 6 months</p>

<ul>
<li>All Pro Features</li>
<li>Choose Personal Trainer</li>
<li>Priority Support</li>
</ul>

<form action="ServletGym" method="post">
<input type="hidden" name="action" value="upgradePlan">
<input type="hidden" name="planName" value="Elite">

<button type="submit" class="btn">
Choose Elite
</button>

</form>

</div>

</div>
</div>

<script src="js/script.js"></script>

</body>
</html>