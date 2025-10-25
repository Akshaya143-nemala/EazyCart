<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:set var="currentPage" value="home" />


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home - Eazy Cart</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<link rel="stylesheet" href="css/home.css">


</head>
<body>
	<section id="header">
		<img src="images/logo.png" alt="Eazy Cart Logo" class="logo">
		<div>
			<ul id="navbar">
				<li><a class="active" href="home.jsp">Home</a></li>
				<li><a href="shop">Shop</a></li>
				<li><a href="About.jsp">About</a></li>
				<li><a href="Contact.jsp">Contact</a></li>
				<li><a href="login.jsp">Login</a></li>
				<li><a href="view-cart" style="cursor: pointer;"> <i
						class="fas fa-shopping-cart"></i>
				</a></li>

			</ul>
		</div>
	</section>
	<section id="hero">
		<img src="images/hero.jpg" alt="hero">
		<div class="hero-content">
			<div class="left-text">
				<h2>"Shop Smart. Live Stylish. Welcome to EazyCart!"</h2>
			</div>
			<div class="right-text">
				<h4>Your One-Stop Shopping Destination.</h4>
				<p>Save more with coupons & upto 60% off!</p>
				<button>Shop Now</button>
				<a href="shop.jsp" class="shop-button" title="Go to Shop Page"></a>
			</div>
		</div>
	</section>

	<section id="feature" class="section-p1">
		<div class="fe-box">
			<img alt="" src="images/features/f1.png">
			<h6>Free Shipping</h6>
		</div>
		<div class="fe-box">
			<img alt="" src="images/features/f2.png">
			<h6>Online Order</h6>
		</div>
		<div class="fe-box">
			<img alt="" src="images/features/f3.png">
			<h6>Save Money</h6>
		</div>
		<div class="fe-box">
			<img alt="" src="images/features/f4.png">
			<h6>Promotions</h6>
		</div>
		<div class="fe-box">
			<img alt="" src="images/features/f5.png">
			<h6>Happy Sell</h6>
		</div>
		<div class="fe-box">
			<img alt="" src="images/features/f6.png">
			<h6>Support</h6>
		</div>
	</section>

	<section id="product1" class="section-p1">
		<h2>Featured Products</h2>
		<p>"Unleash Your Style -Vibrant, Fresh & Floral"</p>


		<div class="pro-container">
			<c:forEach var="product" items="${products}" varStatus="loop">
				<c:if test="${loop.index < 4}">
					<div class="pro">
						<img src="${product.imagePath}" alt="">
						<div class="des">
							<span>${product.name}</span>
							<h5>${product.description}</h5>
							<h4>₹${product.price}</h4>


						</div>
						<div class="cart" title="Add to Cart">
							<a href="#"><i class="fas fa-cart-shopping"></i></a>
						</div>

					</div>
				</c:if>
			</c:forEach>
		</div>
	</section>



	<section id="product1" class="section-p1">
		<h2>Women's Ethnic Kurta Sets</h2>
		<p>Grace your wardrobe with beautifully crafted traditional styles</p>

		<div class="pro-container">
			<c:forEach var="product" items="${products}" varStatus="loop">
				<c:if test="${loop.index >= 4}">
					<div class="pro">
						<img src="${product.imagePath}" alt="">
						<div class="des">
							<span>${product.name}</span>
							<h5>${product.description}</h5>
							<h4>$${product.price}</h4>
						</div>
						<div class="cart" title="Add to Cart">
							<a href="#"><i class="fas fa-cart-shopping"></i></a>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</section>


	<section id="banner" class="section-m1">
		<img src="images/banner.jpg" alt="banner">
		<div class="banner-content">
			<h4>Repair Services</h4>
			<h2>
				Discover more <span>Styles and Collections</span>
			</h2>
			<button>Explore More</button>
		</div>
	</section>

	<section id="sm-banner" class="section-p1">
		<div class="banner-box">
			<img src="images/banner1.jpg" alt="banner1">
			<div class="banner-text">
				<h4>crazy deals</h4>
				<h2>Buy 1 Get 1 free</h2>
				<span>The best classic dress <br>is on sale at cara
				</span>
				<button>Learn More</button>
			</div>
		</div>

		<div class="banner-box right-align">
			<img src="images/banner2.jpg" alt="banner2">
			<div class="banner-text">
				<h4>special sale</h4>
				<h2>
					Flat <br>50% off
				</h2>
				<span>Don't miss <br>out this weekend!
				</span>
				<button>Shop Now</button>
			</div>
		</div>
	</section>

	<section id="triple-banner" class="section-p1">
		<div class="banner-box box1">
			<img src="images/banner3.jpg" alt="Banner 3">
			<div class="banner-text">
				<h3>Unmissable Offers on Elegant Ethnic Wear</h3>
			</div>
		</div>

		<div class="banner-box box2">
			<img src="images/banner4.jpg" alt="Banner 4">
			<div class="banner-text">
				<h3>
					This Weekend<br>Only-<br>Flat 50% Off <br>on Men's
					Wear
				</h3>
			</div>
		</div>

		<div class="banner-box box3">
			<img src="images/banner5.jpg" alt="Banner 5">
			<div class="banner-text">
				<h3>
					New Season, New Style- <br>Explore Our Latest Range
				</h3>
			</div>
		</div>
	</section>

	<section id="newsletter" class="section-p1">
		<img src="images/banner6.jpg" alt="Newsletter Banner"
			class="newsletter-img">
		<div class="overlay">
			<h4>Sign Up For Newsletter</h4>
			<p>
				Get E-Mail updates about our latest shop and <span>special
					offers.</span>
			</p>
			<div class="form">
				<input type="text" placeholder="Your email address">
				<button>Sign Up</button>
			</div>
		</div>
	</section>




	<footer class="section-p1">
		<div class="col">
			<img src="images/logo.png" alt="">
			<h4>Contact</h4>
			<p>
				<strong>Address:</strong> 22 MG Road, Sector 15, Bengaluru,
				Karnataka 560001
			</p>
			<p>
				<strong>phone:</strong> &#128222; +91 98765 43210 <br>&#128222;
				+91 91234 56789
			</p>
			<p>
				<strong>Hours:</strong> 10.00-18.00, Mon - Sat
			</p>
			<div class="follow">
				<h4>follow us</h4>
				<div class="icon">
					<i class="fab fa-facebook-f"></i> <i class="fab fa-twitter"></i> <i
						class="fab fa-instagram"></i> <i class="fab fa-pinterest-p"></i> <i
						class="fab fa-youtube"></i>
				</div>
			</div>
		</div>

		<div class="col">
			<h4>About</h4>
			<a href="#">About Us</a> <a href="#">Delivery Information</a> <a
				href="#">Privacy Policy</a> <a href="#">Terms & Conditions</a> <a
				href="#">Contact Us</a>
		</div>
		<div class="col">
			<h4>My Account</h4>
			<a href="#">Sign In</a> <a href="#">View Cart</a> <a href="#">My
				Wishlist</a> <a href="#">Track my order</a> <a href="#">Help</a>
		</div>
		<div class="col install">
			<h4>Install App</h4>
			<p>From App Store or Google Play</p>
			<div class="row">
				<img alt="" src="images/download.png">
			</div>
			<p>Secured Payment Gateway</p>
			<img alt="" src="images/pay.jpeg">

		</div>
		<div class="copyright">
			<p>&copy; 2025 Eazy Cart. All rights reserved.</p>

		</div>
	</footer>

</body>
</html>
