<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="currentPage" value="order-success" />
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Order Placed - EazyCart</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <style>
        .success-box {
            text-align: center;
            padding: 150px 20px;
            font-family: 'Segoe UI', sans-serif;
        }

        .success-box h2 {
            color: green;
            font-size: 28px;
            margin-bottom: 15px;
        }

        .success-box p {
            padding: 10px;
            font-size: 16px;
            color: #333;
        }

        .success-box a {
            display: inline-block;
            margin-top: 20px;
            background: #007bff;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
        }

        .success-box a:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

<div class="success-box">
    <h2>Your order has been placed successfully!</h2>
    <p>Thank you for shopping with EazyCart.</p>
    <a href="shop">Continue Shopping</a>  <%-- use 'shop.jsp' if you're not using servlet mapping --%>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
