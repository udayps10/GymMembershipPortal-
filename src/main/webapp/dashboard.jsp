<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User userObj = (User) session.getAttribute("user");

   
    if(userObj == null){
        response.sendRedirect("index.jsp");
        return;
    }

    String username = userObj.getName();
    String trainer = userObj.getTrainer();
    String plan = userObj.getPlan();

    java.util.Calendar cal = java.util.Calendar.getInstance();
    cal.add(java.util.Calendar.MONTH, 6);
    java.util.Date expiryDate = cal.getTime();

    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy");
    String formattedExpiry = sdf.format(expiryDate);

    java.util.Date today = new java.util.Date();
    long diff = expiryDate.getTime() - today.getTime();
    long remainingDays = diff / (1000*60*60*24);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Fitzone Dashboard</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f4f7f6; margin: 0; padding: 20px; }
        .dashboard { max-width: 900px; margin: auto; }
        .header { display: flex; justify-content: space-between; align-items: center; background: #111; color: white; padding: 20px; border-radius: 12px; }
        .card { background: white; padding: 25px; margin: 20px 0; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); border-left: 5px solid #111; }
        .btn { padding: 12px 20px; background: #ff4d4d; color: white; text-decoration: none; border-radius: 8px; font-weight: bold; transition: 0.3s; }
        .btn:hover { opacity: 0.8; }
        .days-count { font-size: 24px; font-weight: bold; color: <%= (remainingDays <= 10) ? "#ff4d4d" : "#16b84e" %>; }
        .grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
    </style>
</head>
<body>

<div class="dashboard">

    <div class="header">
        <h2>Welcome, <%= username %> 💪</h2>
        <a href="ServletGym?action=logout" class="btn">Logout</a>
    </div>

    <div class="grid">
        <div class="card">
            <h3>🏋 Membership Plan</h3>
            <p style="font-size: 18px; color: #555;">
                <%= (plan != null && !plan.isEmpty()) ? plan : "Basic Member" %>
            </p>
        </div>

        <div class="card" style="border-left-color: <%= (remainingDays <= 10) ? "#ff4d4d" : "#16b84e" %>;">
            <h3>⏳ Membership Status</h3>
            <p class="days-count">
                <%= (remainingDays > 0) ? remainingDays + " Days Left" : "Expired" %>
            </p>
            <p>
                <small>Valid until: <%= formattedExpiry %></small>
            </p>
        </div>
    </div>

    <%-- Trainer section ONLY for Elite members --%>
    <% if("Elite".equalsIgnoreCase(plan)) { %>
        <div class="card">
            <h3>👨‍🏫 Your Personal Trainer</h3>
            <p style="font-size: 18px;">
                <%= (trainer != null && !trainer.equals("None")) ? trainer : "No Trainer Assigned Yet" %>
            </p>
            <a href="trainers.jsp" style="color: #2196F3; text-decoration: none; font-weight: bold;">Choose Trainer →</a>
        </div>
    <% } %>

    <div class="card">
        <h3>⚡ Quick Actions</h3>
        <div style="display: flex; gap: 10px; margin-top: 15px;">
            <a href="editMember.jsp" class="btn" style="background: #2196F3;">Edit Profile</a>
            <a href="subscription.jsp" class="btn" style="background: #111;">Renew Plan</a>
        </div>
    </div>

</div>

</body>
</html>