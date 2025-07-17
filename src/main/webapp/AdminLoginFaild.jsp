<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Message | Online Electronic Store</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: "Segoe UI", sans-serif;
      background: linear-gradient(to right, #80deea, #00bcd4);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .message-container {
      background-color: #ffffff;
      padding: 40px 50px;
      border-radius: 20px;
      box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
      text-align: center;
      animation: fadeIn 1s ease-out forwards;
      width: 400px;
    }

    .message-container h1 {
      color: #009688;
      margin-bottom: 20px;
    }

    .message-container p {
      font-size: 1.2em;
      color: #333;
      margin-bottom: 30px;
    }

    a {
      padding: 12px 30px;
      background-color: #009688;
      color: white;
      text-decoration: none;
      border-radius: 25px;
      font-weight: bold;
      transition: background-color 0.3s ease, transform 0.3s ease;
    }

    a:hover {
      background-color: #00796b;
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
  <div class="message-container">
    <h1>
      <%
        String data = (String)request.getAttribute("msg");
        out.println(data + "<br><br>");
      %>
    </h1>
    <a href="index.html">Go to Home</a>
  </div>
</body>
</html>
