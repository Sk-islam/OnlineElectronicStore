<%@ page import="com.pack.AdminBean" %>
<%@ page import="com.pack.AddProductBean" %>
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
      background-color: #f0f0f0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .container {
      background-color: #fff;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      width: 400px;
      text-align: center;
    }

    h1 {
      color: #388e3c;
    }

    .message {
      margin: 20px 0;
      color: #333;
    }

    a {
      display: block;
      margin: 10px 0;
      padding: 10px;
      background-color: #388e3c;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      font-size: 16px;
      transition: background-color 0.3s ease;
    }

    a:hover {
      background-color: #2e7d32;
    }
  </style>
</head>
<body>

  <div class="container">
    <h1>
      <%
        AdminBean abean = (AdminBean)session.getAttribute("abean");
        AddProductBean pbean = (AddProductBean)request.getAttribute("pbean");
        String data = (String)request.getAttribute("msg");

        out.println("Hello " + abean.getFname() + "<br><br>");
        out.println("<div class='message'>" + data + "</div>");
      %>
      
    </h1>
    
    <a href="AddProduct.html">Add Product</a>
    <a href="View1">View Products</a>
    <a href="Logout">Log Out</a>
  </div>

</body>
</html>
