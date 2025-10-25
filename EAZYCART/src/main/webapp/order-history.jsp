<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>Your Order History</title>
    <link rel="stylesheet" href="css/order-history.css">
</head>
<body>
    <h2>Your Orders</h2>

    <p>Total ordered items: <strong>${fn:length(orderItems)}</strong></p>

    <c:choose>
        <c:when test="${not empty orderItems}">
            <table border="1" cellpadding="5" cellspacing="0" style="width: 100%; border-collapse: collapse;">
                <thead style="background-color: #f2f2f2;">
                    <tr>
                        <th>Order ID</th>
                        <th>Date</th>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price (₹)</th>
                        <th>Subtotal (₹)</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${orderItems}">
                        <tr>
                            <td>${item.orderId}</td>
                            <td>${item.orderDate}</td>
                            <td>${item.productName}</td>
                            <td>${item.quantity}</td>
                            <td>₹${item.price}</td>
                            <td>₹${item.total}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>You have no orders yet.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
