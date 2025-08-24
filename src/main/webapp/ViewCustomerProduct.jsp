<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pack.AddProductBean" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Products</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1100px;
            margin: 50px auto;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #222;
            margin-bottom: 40px;
        }
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
        }
        .product-card {
            background: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            text-align: center;
        }
        .product-card:hover {
            transform: translateY(-5px);
        }
        .product-card img {
            width: 100%;
            max-height: 180px;
            object-fit: contain;
            margin-bottom: 15px;
        }
        .product-info h3 {
            margin: 0;
            color: #333;
        }
        .product-info p {
            margin: 5px 0;
            color: #555;
        }
        .buy-btn {
            display: inline-block;
            margin-top: 10px;
            background-color: #4CAF50;
            color: white;
            padding: 10px 16px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .buy-btn:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

<div class="container">
  <h2>Available Products</h2>

  <%
    ArrayList<AddProductBean> al = (ArrayList<AddProductBean>) session.getAttribute("Productlist");
    if (al == null || al.isEmpty()) {
  %>
    <p style="text-align: center; color: #888;">No products available.</p>
  <%
    } else {
  %>
  <div class="products-grid">
    <%
      for (AddProductBean bean : al) {
          String searchQuery = bean.getP_company() + " " + bean.getP_name();  // brand + product name
    %>
      <div class="product-card" data-query="<%= searchQuery %>">
        <img src="https://via.placeholder.com/200x150?text=Loading..." alt="<%= searchQuery %>">
        <div class="product-info">
          <h3><%= bean.getP_code() %> - <%= bean.getP_name() %></h3>
          <p>Brand: <%= bean.getP_company() %></p>
          <p>Price: ₹<%= bean.getP_price() %></p>
          <p>Available Qty: <%= bean.getP_qty() %></p>
        </div>
        <a class="buy-btn" href="BuyProduct?pcode=<%= bean.getP_code() %>">Buy</a>
      </div>
    <%
      }
    %>
  </div>
  <%
    }
  %>
</div>

<script>
const UNSPLASH_ACCESS_KEY = "KRTVhLBvX8rcEExQnzOF1lPCLjsgGnqs0XbhOPWamCU";

document.querySelectorAll(".product-card").forEach(async (card) => {
  const query = card.getAttribute("data-query");
  const imgTag = card.querySelector("img");

  try {
    const response = await fetch(
      `https://api.unsplash.com/search/photos?query=\${encodeURIComponent(query)}&client_id=\${UNSPLASH_ACCESS_KEY}&per_page=1`
    );
    const data = await response.json();

    if (data.results.length > 0) {
      imgTag.src = data.results[0].urls.small;
    } else {
      imgTag.src = "https://via.placeholder.com/200x150?text=No+Image";
    }
  } catch (error) {
    imgTag.src = "https://via.placeholder.com/200x150?text=Error";
    console.error("Image fetch error:", error);
  }
});
</script>

</body>
</html>
