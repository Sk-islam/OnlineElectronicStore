<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Logout Successful</title>
  <style>
    body {
      font-family: "Segoe UI", sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }

    .container {
      width: 50%;
      margin: 100px auto;
      background-color: #ffffff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    h2 {
      color: #388e3c;
    }

    .message {
      font-size: 18px;
      margin-top: 20px;
    }

    .back-btn {
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #388e3c;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s;
    }

    .back-btn:hover {
      background-color: #2e7d32;
    }
  </style>
</head>
<body>

  <div class="container">
    <h2>Logout Successful</h2>
    
    <div class="message">
      <%
          session.invalidate();  // Invalidates the session
          out.println("You have logged out successfully.<br><br>");
      %>
    </div>
    
    <a href="index.html" class="back-btn">Go Back to Home</a>
  </div>

</body>
</html>
