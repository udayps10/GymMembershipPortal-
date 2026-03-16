<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    
    User u = (User) session.getAttribute("user");

    
    if(u == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Personal Trainer | Fitzone</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            background: linear-gradient(135deg, #e9edf3, #d8e1ec);
        }

        h2 {
            margin-top: 50px;
            font-size: 34px;
            font-weight: 600;
            color: #222;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.05);
        }

       
        .trainer-container {
            display: grid;
            grid-template-columns: repeat(3, 300px);
            gap: 35px;
            margin-top: 40px;
        }

        .trainer-card {
            position: relative;
        }

        input[type="radio"] {
            display: none;
        }

        label {
            display: block;
            padding: 35px;
            border-radius: 18px;
            cursor: pointer;
            transition: all 0.35s ease;
            background: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.4);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            text-align: center;
        }

        h3 {
            margin: 10px 0;
            font-size: 22px;
            color: #111;
        }

        p {
            margin: 6px 0;
            font-size: 15px;
            color: #555;
        }

        label:hover {
            transform: translateY(-8px);
            box-shadow: 0 18px 35px rgba(0, 0, 0, 0.15);
            background: rgba(255, 255, 255, 0.8);
        }

       
        input[type="radio"]:checked + label {
            background: linear-gradient(135deg, #1ed760, #16b84e);
            color: white;
            box-shadow: 0 0 25px rgba(30, 215, 96, 0.5), 0 20px 40px rgba(0, 0, 0, 0.2);
            transform: scale(1.05);
            border: none;
        }

        input[type="radio"]:checked + label h3,
        input[type="radio"]:checked + label p {
            color: white;
        }

      
        .confirm-btn {
            margin-top: 50px;
            margin-bottom: 50px;
            padding: 16px 60px;
            border: none;
            border-radius: 50px;
            background: #111;
            color: white;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .confirm-btn:hover {
            transform: scale(1.07);
            background: #333;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        }

        @media(max-width: 1050px) {
            .trainer-container {
                grid-template-columns: repeat(2, 300px);
            }
        }
        @media(max-width: 700px) {
            .trainer-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

    <h2>Choose Your Personal Trainer</h2>

    <form action="ServletGym" method="post">
        <input type="hidden" name="action" value="selectTrainer">
        
        <input type="hidden" name="userId" value="<%= u.getId() %>">

        <div class="trainer-container">

            <div class="trainer-card">
                <input type="radio" name="trainer" value="Mahek Singh" id="t1" required>
                <label for="t1">
                    <h3>Mahek Singh</h3>
                    <p>Female Trainer</p>
                    <p>🕒 7 AM – 4 PM</p>
                </label>
            </div>

            <div class="trainer-card">
                <input type="radio" name="trainer" value="Sakshi Singh" id="t2">
                <label for="t2">
                    <h3>Sakshi Singh</h3>
                    <p>Female Trainer</p>
                    <p>🕒 4 PM – 11 PM</p>
                </label>
            </div>

            <div class="trainer-card">
                <input type="radio" name="trainer" value="Udaypratap Singh" id="t3">
                <label for="t3">
                    <h3>Udaypratap Singh</h3>
                    <p>Pro Athlete</p>
                    <p>🕒 7 AM – 4 PM</p>
                </label>
            </div>

            <div class="trainer-card">
                <input type="radio" name="trainer" value="Ashmit Singh" id="t4">
                <label for="t4">
                    <h3>Ashmit Singh</h3>
                    <p>Strength Coach</p>
                    <p>🕒 7 PM – 4 AM</p>
                </label>
            </div>

            <div class="trainer-card">
                <input type="radio" name="trainer" value="Vicky Singh" id="t5">
                <label for="t5">
                    <h3>Vicky Singh</h3>
                    <p>Cardio Specialist</p>
                    <p>🕒 4 PM – 10 PM</p>
                </label>
            </div>

            <div class="trainer-card">
                <input type="radio" name="trainer" value="Ankit Singh" id="t6">
                <label for="t6">
                    <h3>Ankit Singh</h3>
                    <p>Yoga Expert</p>
                    <p>🕒 4 PM – 10 PM</p>
                </label>
            </div>

        </div>

        <button type="submit" class="confirm-btn">Confirm Trainer</button>

    </form>

    <br>
    <a href="dashboard.jsp" style="text-decoration:none; color:#666; margin-bottom: 40px;">← Back to Dashboard</a>

</body>
</html>