<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="currentPage" value="contact-success" />       <!-- Change value depending on page -->
<jsp:include page="header.jsp" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Submitted - EazyCart</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <style>
        .thank-you {
            padding: 120px;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        .thank-you h2 {
        padding:30px;
            font-size: 28px;
            color: #333;
        }

        .thank-you p {
        padding:30px;
            font-size: 18px;
            color: #555;
        }

        .thank-you a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="thank-you">
    <h2>Thank you, ${name}!</h2>
    <p>We’ve received your message and will get back to you at <strong>${email}</strong> shortly.</p>
    <p><a href="home">Return to Home</a></p>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
