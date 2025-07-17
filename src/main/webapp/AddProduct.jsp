<%@ page import="com.pack.AdminBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      background: linear-gradient(to right, #fce4ec, #f8bbd0);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .dashboard-container {
      background-color: #ffffff;
      padding: 50px;
      border-radius: 20px;
      box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
      text-align: center;
      animation: fadeIn 1s ease-out forwards;
      width: 400px;
    }

    .dashboard-container h1 {
      color: #c2185b;
      margin-bottom: 25px;
    }

    a {
      display: inline-block;
      margin: 15px 25px;
      padding: 15px 30px;
      background-color: #c2185b;
      color: white;
      text-decoration: none;
      border-radius: 25px;
      font-weight: bold;
      transition: background-color 0.3s ease, transform 0.3s ease;
    }

    a:hover {
      background-color: #880e4f;
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
        String data = (String) request.getAttribute("msg");
        out.println(data + " Mr. " + abean.getFname());
      %>
    </h1>
    <a href="AddProduct.html">Add Product</a>
    <a href="View1">View Products</a>
    <a href="Logout">Logout</a>
  </div>
</body>
</html>
