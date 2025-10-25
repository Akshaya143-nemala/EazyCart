<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="currentPage" value="about" />
<!-- Change value depending on page -->
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>About Us - EazyCart</title>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/about.css">
</head>
<body>



	<section class="about-section">
		<div class="about-container">
			<h2>About EazyCart</h2>
			<p>
				Welcome to <strong>EazyCart</strong>, your one-stop destination for
				a seamless and enjoyable shopping experience! At EazyCart, we are
				passionate about providing high-quality products at the best prices,
				ensuring convenience, trust, and satisfaction with every purchase.
			</p>
			<p>Our platform offers a wide range of categories including
				fashion, electronics, accessories, and more — all accessible from
				the comfort of your home. With user-friendly navigation, secure
				payments, and fast delivery, we make online shopping truly easy.</p>
			<p>EazyCart is built by students as a project, combining learning
				with innovation. We are committed to continuously improving and
				adding exciting features to serve you better.</p>
			<h3>Why Choose EazyCart?</h3>
			<ul>
				<li>✔ Wide range of quality products</li>
				<li>✔ Easy-to-use interface</li>
				<li>✔ Secure and smooth checkout process</li>
				<li>✔ Reliable support and service</li>
			</ul>
			<p style="margin-top: 20px;">Thank you for visiting EazyCart.
				Happy shopping!</p>
		</div>
	</section>

	<jsp:include page="footer.jsp" />

</body>
</html>
