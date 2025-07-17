<%@ page import="com.pack.AdminBean" %>
<%@ page import="com.pack.AddProductBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Product | Online Electronic Store</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: "Segoe UI", sans-serif;
      background-color: #f4f4f9;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .edit-form-container {
      background-color: #ffffff;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      text-align: center;
      width: 400px;
      animation: fadeIn 1s ease-out forwards;
    }

    .edit-form-container h1 {
      color: #388e3c;
      margin-bottom: 20px;
    }

    .edit-form-container input[type="text"] {
      width: 80%;
      padding: 10px;
      margin: 10px 0;
      border-radius: 5px;
      border: 1px solid #ddd;
      font-size: 16px;
    }

    .edit-form-container input[type="submit"] {
      width: 80%;
      padding: 12px;
      margin-top: 20px;
      border-radius: 5px;
      background-color: #388e3c;
      color: white;
      font-size: 16px;
      border: none;
      cursor: pointer;
      transition: background-color 0.3s ease, transform 0.3s ease;
    }

    .edit-form-container input[type="submit"]:hover {
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

  <div class="edit-form-container">
    <h1>
      <%
        AdminBean abean = (AdminBean)session.getAttribute("abean");
        AddProductBean pbean = (AddProductBean)request.getAttribute("pbean");
        out.println("<u>Hello " + abean.getFname() + ", Please Edit</u><br><br>");
      %>
    </h1>
    
    <form action="update" method="post">
      <label for="P_code">Product Price:</label><br>
      <input type="text" name="P_code" value="<%= pbean.getP_price() %>" required><br><br>
      
      <label for="P_qty">Product Quantity:</label><br>
      <input type="text" name="P_qty" value="<%= pbean.getP_qty() %>" required><br><br>
      
      <input type="hidden" name="p_code" value="<%= pbean.getP_code() %>">
      
      <input type="submit" value="Update Product">
    </form>
  </div>

</body>
</html>
