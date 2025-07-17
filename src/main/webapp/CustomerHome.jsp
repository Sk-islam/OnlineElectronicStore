<%@ page import="com.pack.CustomerBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Customer Dashboard</title>
  <style>
    body {
      font-family: "Segoe UI", sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }

    .container {
      width: 80%;
      margin: 40px auto;
      background-color: #ffffff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
      color: #388e3c;
      text-align: center;
    }

    .message {
      font-size: 18px;
      text-align: center;
      margin-top: 20px;
    }

    .nav-links {
      text-align: center;
      margin-top: 20px;
    }

    .nav-links a {
      display: inline-block;
      margin: 10px 20px;
      padding: 10px 20px;
      background-color: #388e3c;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s;
    }

    .nav-links a:hover {
      background-color: #2e7d32;
    }

    .logout-btn {
      display: block;
      text-align: center;
      padding: 10px 20px;
      background-color: #f44336;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      margin-top: 20px;
    }

    .logout-btn:hover {
      background-color: #d32f2f;
    }
  </style>
</head>
<body>

  <div class="container">
    <h1>Customer Dashboard</h1>
    
    <div class="message">
      <%
        CustomerBean cbean = (CustomerBean) session.getAttribute("cbean");
        if (cbean != null) {
          out.println("Welcome, " + cbean.getFirstname() + "!");
        } else {
          response.sendRedirect("CustomerLogin.html");
        }
      %>
    </div>

    <div class="nav-links">
      <a href="View2">View Products</a>
     <%-- <a href="OrderHistory">🧾 View Order History</a>  Added this line --%>
    </div>

    <a href="Logout" class="logout-btn">Logout</a>
  </div>

</body>
</html>
