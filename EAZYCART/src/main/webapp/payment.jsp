<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment - Eazy Cart</title>
    <link rel="stylesheet" href="css/payment.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>

    <div class="payment-section">
        <div class="payment-container">
            <h2>Payment Details</h2>
            <p>Please enter your card information to complete the order.</p>

            <form action="order-success.jsp" method="post" class="payment-form">
                <label for="cardNumber">Card Number</label>
                <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" required maxlength="16" pattern="\d{16}">

                <label for="expiry">Expiry Date</label>
                <input type="text" id="expiry" name="expiry" placeholder="MM/YY" required pattern="\d{2}/\d{2}">

                <label for="cvv">CVV</label>
                <input type="password" id="cvv" name="cvv" placeholder="123" required maxlength="3" pattern="\d{3}">

                <button type="submit" class="pay-btn">Pay Now</button>
            </form>
        </div>
    </div>

<%@ include file="footer.jsp" %>

</body>
</html>
