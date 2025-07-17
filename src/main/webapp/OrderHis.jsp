<%@ page import="java.util.*, com.pack.OrderBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>Order History</title>
</head>
<body>
    <h2>Your Order History</h2>
    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>Product</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Order Date</th>
        </tr>
        <%
            ArrayList<OrderBean> orders = (ArrayList<OrderBean>) request.getAttribute("orderList");
            if (orders != null) {
                for (OrderBean ob : orders) {
        %>
        <tr>
            <td><%= ob.getOrderId() %></td>
            <td><%= ob.getProductName() %></td>
            <td><%= ob.getProductPrice() %></td>
            <td><%= ob.getQuantity() %></td>
            <td><%= ob.getOrderDate() %></td>
        </tr>
        <%      }
            } else { %>
            <tr><td colspan="5">No orders found.</td></tr>
        <% } %>
    </table>
</body>
</html>
