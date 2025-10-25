<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="currentPage" value="shop" />
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shop - Eazy Cart</title>
    <link rel="stylesheet" href="css/shop.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

   <c:if test="${param.added == 'success'}">
       <p style="color: green; text-align: center;">Item added to cart successfully!</p>
   </c:if>

    <section id="product1" class="section-p1">
        <h2>Our Products</h2>
        <p>Latest Fashion at Best Prices</p>

        <div class="pro-container">
            <c:forEach var="product" items="${products}">
                <div class="pro" id="product${product.id}">
                    <img src="${product.imagePath}" alt="Product Image">

                    <div class="des">
                        <span>${product.name}</span>
                        <h5>${product.description}</h5>
                        <h4>₹${product.price}</h4>
                    </div>

                    <form action="add-to-cart#product${product.id}" method="post">
                        <input type="hidden" name="productId" value="${product.id}">
                        <input type="hidden" name="userId" value="${sessionScope.userId}">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit" class="cart">
                            <i class="fa fa-shopping-cart"></i>
                        </button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </section>

    <section id="orders" class="section-p1" style="margin-top: 40px;">
        <h2>Your Orders</h2>

        <!-- Debug: show number of order items -->
        <p>Total ordered items: <strong>${fn:length(orderItems)}</strong></p>

        <c:choose>
            <c:when test="${not empty orderItems}">
                <table class="cart-table" style="width: 100%; margin-top: 20px; border-collapse: collapse;">
                    <thead style="background-color: #f2f2f2;">
                        <tr>
                            <th style="padding: 8px; border: 1px solid #ddd;">Order ID</th>
                            <th style="padding: 8px; border: 1px solid #ddd;">Date</th>
                            <th style="padding: 8px; border: 1px solid #ddd;">Product</th>
                            <th style="padding: 8px; border: 1px solid #ddd;">Qty</th>
                            <th style="padding: 8px; border: 1px solid #ddd;">Price</th>
                            <th style="padding: 8px; border: 1px solid #ddd;">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${orderItems}">
                            <tr>
                                <td style="padding: 8px; border: 1px solid #ddd;">${item.orderId}</td>
                                <td style="padding: 8px; border: 1px solid #ddd;">${item.orderDate}</td>
                                <td style="padding: 8px; border: 1px solid #ddd;">${item.productName}</td>
                                <td style="padding: 8px; border: 1px solid #ddd;">${item.quantity}</td>
                                <td style="padding: 8px; border: 1px solid #ddd;">₹${item.price}</td>
                                <td style="padding: 8px; border: 1px solid #ddd;">₹${item.total}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p>You have no orders yet.</p>
            </c:otherwise>
        </c:choose>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
