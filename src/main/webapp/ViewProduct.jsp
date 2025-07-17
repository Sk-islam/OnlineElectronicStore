<%@ page import="com.pack.AdminBean" %>
<%@ page import="com.pack.AddProductBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Product Details | Admin Dashboard</title>
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

    h2 {
      color: #333;
      text-align: center;
    }

    .product-list {
      list-style-type: none;
      padding: 0;
    }

    .product-item {
      background-color: #f9f9f9;
      padding: 10px;
      margin: 10px 0;
      border-radius: 5px;
      box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }

    .product-item a {
      color: #388e3c;
      text-decoration: none;
      margin-right: 10px;
    }

    .product-item a:hover {
      text-decoration: underline;
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
    <h1>Welcome Admin</h1>

<%
  AdminBean abean = (AdminBean) session.getAttribute("abean");
  ArrayList<AddProductBean> al = (ArrayList<AddProductBean>) session.getAttribute("Productlist");

  if (abean == null) {
    // Session expired or admin not logged in
    response.sendRedirect("AdminLogin.html"); // Redirect to admin login page
    return;
  }

  out.println("<h2>Hello " + abean.getFname() + ", These are Your Product Details:</h2><br><br>");

  if (al == null || al.size() == 0) {
    out.println("<p>PRODUCTS NOT AVAILABLE !!</p>");
  } else {
    out.println("<ul class='product-list'>");
    for (AddProductBean bean : al) {
      out.println("<li class='product-item'>");
      out.println(bean.getP_code() + " - " + bean.getP_name() + " | " + bean.getP_company() + " | ₹" + bean.getP_price() + " | " + bean.getP_qty() +
        " <a href='edit?pcode=" + bean.getP_code() + "'>Edit</a>" +
        " <a href='delete?pcode=" + bean.getP_code() + "'>Delete</a>");
      out.println("</li>");
    }
    out.println("</ul>");
  }
%>


    <a href="Logout" class="logout-btn">Logout</a>
  </div>

</body>
</html>
