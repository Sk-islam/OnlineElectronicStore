<%@ page import="com.pack.AdminBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | Online Electronic Store</title>
<style>
  body {
    margin: 0;
    padding: 0;
    font-family: "Segoe UI", sans-serif;
    background: linear-gradient(to right, #e3f2fd, #bbdefb);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .dashboard {
    background-color: #ffffff;
    padding: 50px;
    border-radius: 20px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    text-align: center;
    animation: slideIn 0.8s ease-out forwards;
  }

  .dashboard h2 {
    color: #1976d2;
    margin-bottom: 30px;
  }

  .dashboard a {
    display: inline-block;
    margin: 10px 15px;
    padding: 12px 25px;
    background-color: #2196f3;
    color: white;
    border-radius: 30px;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.3s ease;
  }

  .dashboard a:hover {
    background-color: #1565c0;
    transform: scale(1.05);
  }

  @keyframes slideIn {
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
  <div class="dashboard">
    <h2>
      <%
        AdminBean bean = (AdminBean)session.getAttribute("abean");
        if(bean != null) {
            out.println("Welcome Mr. " + bean.getFname());
        } else {
            response.sendRedirect("AdminLogin.html");
        }
      %>
    </h2>
    <a href="AddProduct.html">Add Product</a>
    <a href="View1">View Products</a>
    <a href="Logout">Logout</a>
  </div>
</body>
</html>
