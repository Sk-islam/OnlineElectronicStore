<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Buy Product</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        table {
            margin: 50px auto;
            border-collapse: collapse;
            width: 80%;
            background: white;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #00bcd4;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        input[type="number"], input[type="submit"] {
            padding: 8px;
            margin-top: 10px;
        }
        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    com.pack.AddProductBean selectedProduct = (com.pack.AddProductBean) request.getAttribute("selectedProduct");
%>

<h2 style="text-align:center;">Selected Product</h2>

<% if (selectedProduct != null) { %>
    <table border="1">
        <tr>
            <th>Product Code</th>
            <th>Name</th>
            <th>Company</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Buy</th>
        </tr>
        <tr>
            <td><%= selectedProduct.getP_code() %></td>
            <td><%= selectedProduct.getP_name() %></td>
            <td><%= selectedProduct.getP_company() %></td>
            <td><%= selectedProduct.getP_price() %></td>
            <td><%= selectedProduct.getP_qty() %></td>
            <td>
                <form id="buyForm" method="post" action="PlaceOrder" onsubmit="return showBill(event);">
                    <input type="hidden" name="code" value="<%= selectedProduct.getP_code() %>">
                    Quantity:
                    <input type="number" id="quantityInput" name="quantity" min="1" max="<%= selectedProduct.getP_qty() %>" value="1" required>
                    <br>
                    <input type="submit" value="Buy Now" <%= (Integer.parseInt(selectedProduct.getP_qty()) == 0) ? "disabled" : "" %> >
                </form>
            </td>
        </tr>
    </table>
<% } else { %>
    <p style="color:red; text-align:center;">Product not found!</p>
<% } %>

</body>
</html>
