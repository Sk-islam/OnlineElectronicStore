<%@ page import="com.pack.AdminBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard | Online Electronic Store</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: "Segoe UI", sans-serif;
      background: linear-gradient(to right, #f9fbe7, #c8e6c9);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .dashboard-container {
      background-color: #ffffff;
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
      text-align: center;
      width: 400px;
      animation: fadeIn 1s ease-out forwards;
    }

    .dashboard-container h1 {
      color: #388e3c;
      margin-bottom: 20px;
    }

    .dashboard-container a {
      display: block;
      padding: 12px 30px;
      margin: 10px 0;
      background-color: #388e3c;
      color: white;
      text-decoration: none;
      border-radius: 25px;
      font-weight: bold;
      transition: background-color 0.3s ease, transform 0.3s ease;
    }

    .dashboard-container a:hover {
      background-color: #2e7d32;
      transform: scale(1.05);
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(40px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  </style>
</head>
<body>
  <div class="dashboard-container">
    <h1>
      <%
        AdminBean abean = (AdminBean)session.getAttribute("abean");
        String data = (String)request.getAttribute("msg");
        out.println("Hello " + abean.getFname() + ", " + data + "<br><br>");
      %>
    </h1>
    <a href="AddProduct.html">Add Product</a>
    <a href="View1">View Product</a>
    <a href="Logout">Log Out</a>
  </div>
</body>
</html>
