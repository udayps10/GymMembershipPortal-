# 🏋️‍♂️ Gym Membership Portal

A full-stack Java web application designed to manage gym memberships, user subscriptions, and trainer assignments with a clean and user-friendly interface.


## 🚀 Overview

The Gym Membership Portal allows users to register, choose membership plans, assign trainers, and track their subscription details through a personalized dashboard.

This project demonstrates full-stack development using Java Servlets, JSP, and MySQL, following an MVC-based architecture.


## ✨ Features

### 👤 User Features
- User Registration & Login system  
- Secure session management  
- Personalized dashboard  
- Membership plan selection (Basic, Pro, Elite)  
- Upgrade membership plans  
- Trainer selection (available for Elite users)  
- Subscription validity tracking with expiry date  

### ⚙️ System Features
- Dynamic plan upgrade functionality  
- Session-based authentication and authorization  
- Automatic subscription expiry calculation (6-month plans)  
- Clean separation using MVC architecture  

---

## 🧱 Tech Stack

**Frontend**
- HTML  
- CSS  
- JSP (Java Server Pages)  

**Backend**
- Java Servlets  
- JDBC (Java Database Connectivity)  

**Database**
- MySQL  

**Server**
- Apache Tomcat  

**Architecture**
- MVC (Model-View-Controller)  
  - Model → User, DAO classes  
  - View → JSP pages  
  - Controller → Servlets  

---

## 📂 Project Structure


GymMembershipPortal/
│
├── src/
│ ├── dao/
│ ├── model/
│ ├── servlet/
│ └── util/
│
├── WebContent/
│ ├── css/
│ ├── adminDashboard.jsp
│ ├── dashboard.jsp
│ ├── editMember.jsp
│ ├── index.jsp
│ ├── logout.jsp
│ ├── register.jsp
│ ├── subscription.jsp
│ ├── trainers.jsp
│ └── viewMembers.jsp
│
└── README.md


---



## ⚙️ How to Run Locally

1. Clone the repository:
   ```bash
   git clone https://github.com/udayps10/GymMembershipPortal-.git

Import the project into Eclipse IDE

Configure Apache Tomcat Server

Set up MySQL database:

Create required tables

Update database credentials in DBConnection.java

Run the project on the server

Open in browser:

http://localhost:8080/GymMembershipPortal


---

# 💡 What I Learned

Building full-stack applications using Java

Understanding Servlets and JSP lifecycle

Implementing session management and authentication

Applying MVC architecture in real-world projects

Handling database operations using JDBC


---


 # 👨‍💻 Author

Uday Singh
GitHub: https://github.com/udayps10
