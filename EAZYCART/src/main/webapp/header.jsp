<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Font Awesome (for cart icon) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="css/header.css">

<section id="header">
	<img src="images/logo.png" alt="Eazy Cart Logo" class="logo">
	<div>
		<ul id="navbar">
			<li><a href="home"
				class="${currentPage eq 'home' ? 'active' : ''}">Home</a></li>
			<li><a href="shop"
				class="${currentPage eq 'shop' ? 'active' : ''}">Shop</a></li>
			<li><a href="about.jsp"
				class="${currentPage eq 'about' ? 'active' : ''}">About</a></li>
			<li><a href="contact.jsp"
				class="${currentPage eq 'contact' ? 'active' : ''}">Contact</a></li>

			<!-- Show search bar only on Shop page -->

			<li><a href="login.jsp"
				class="${currentPage eq 'login' ? 'active' : ''}">Login</a></li>
			<!-- header.jsp or wherever your menu is -->
<li><a href="${pageContext.request.contextPath}/order-history"
       class="${currentPage eq 'order-history' ? 'active' : ''}">My Orders</a></li>

			

			<!-- Cart Icon -->
			<li><a href="view-cart"
				class="${currentPage eq 'cart' ? 'active' : ''}"><i
					class="fas fa-shopping-cart"></i></a></li>
		</ul>
	</div>
</section>
