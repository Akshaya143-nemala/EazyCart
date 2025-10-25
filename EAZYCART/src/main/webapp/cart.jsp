<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:set var="currentPage" value="cart" />
<!-- Change value depending on page -->
<jsp:include page="header.jsp" />


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Your Cart - EazyCart</title>
<link rel="stylesheet" href="css/cart.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

	<jsp:include page="header.jsp" />

	<div class="cart-container">
		<h2>Your Shopping Cart</h2>

		<c:choose>
			<c:when test="${empty cartProducts}">
				<p style="text-align: center;">Your cart is empty.</p>
			</c:when>
			<c:otherwise>
				<table class="cart-table">
					<thead>
						<tr>
							<th>Image</th>
							<th>Product</th>
							<th>Description</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${cartProducts}">
							<tr>
								<td><img src="${product.imagePath}" alt="${product.name}"
									width="60" height="60"></td>
								<td>${product.name}</td>
								<td>${product.description}</td>
								<td>₹${product.price}</td>
								<td>
									<form action="update-cart" method="post"
										style="display: inline;">
										<input type="hidden" name="productId" value="${product.id}">
										<input type="hidden" name="action" value="decrease">
										<button type="submit">−</button>
									</form> ${product.quantity}

									<form action="update-cart" method="post"
										style="display: inline;">
										<input type="hidden" name="productId" value="${product.id}">
										<input type="hidden" name="action" value="increase">
										<button type="submit">+</button>
									</form>
								</td>
								<td>
									<form action="update-cart" method="post">
										<input type="hidden" name="productId" value="${product.id}">
										<input type="hidden" name="action" value="remove">
										<button type="submit">Remove</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- Optional total section -->
				<div class="total-section">
					<strong>Total: ₹<c:out value="${totalPrice}" /></strong>
				</div>

				<div style="text-align: center; margin-top: 20px;">
					<a href="payment.jsp" class="checkout-btn">Proceed to Checkout</a>
				</div>


			</c:otherwise>
		</c:choose>
	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>
