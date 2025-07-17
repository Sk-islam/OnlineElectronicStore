<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        /* Style for the loading spinner */
        .loading-spinner {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 4px solid #f3f3f3; /* Light grey background */
            border-top: 4px solid #3498db; /* Blue color */
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 2s linear infinite;
            display: none;
        }

        /* Animation for the spinner */
        @keyframes spin {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }
    </style>
</head>
<body>

<%
    String flashMessage = (String) request.getAttribute("flashMessage");
    String productName = (String) request.getAttribute("productName");
    String pricePerItem = (String) request.getAttribute("pricePerItem");
    String quantity = (String) request.getAttribute("quantity");
    String totalAmount = (String) request.getAttribute("totalAmount");
%>

<!-- Loading Spinner -->
<div class="loading-spinner" id="loadingSpinner"></div>

<script>
    const productName = "<%= productName %>";
    const pricePerItem = "<%= pricePerItem %>";
    const quantity = "<%= quantity %>";
    const totalAmount = "<%= totalAmount %>";

    Swal.fire({
        title: 'Confirm Your Order',
        html: `
            <div style="text-align:left;">
                <p><strong>Product:</strong> ${productName}</p>
                <p><strong>Price per item:</strong> ₹${pricePerItem}</p>
                <p><strong>Quantity:</strong> ${quantity}</p>
                <p><strong>Total Amount:</strong> ₹${totalAmount}</p>
            </div>
        `,
        icon: 'info',
        showCancelButton: true,
        confirmButtonText: 'Buy Now',
        cancelButtonText: 'Cancel Order'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire(
                'Order Placed!',
                '<%= flashMessage %>',
                'success'
            ).then(() => {
                // Show loading spinner before redirect
                document.getElementById('loadingSpinner').style.display = 'block'; // Show loading spinner
                setTimeout(function() {
                    window.location.href = "Logout.jsp"; // Redirect to logout after 3 seconds
                }, 3000);
            });
        } else {
            Swal.fire(
                'Order Cancelled!',
                'You have successfully cancelled your order.',
                'error'
            ).then(() => {
                // Show loading spinner before redirect
                document.getElementById('loadingSpinner').style.display = 'block'; // Show loading spinner
                setTimeout(function() {
                    window.location.href = "Logout.jsp"; // Redirect to logout after 3 seconds
                }, 3000);
            });
        }
    });
</script>

</body>
</html>
