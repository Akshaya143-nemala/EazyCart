<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="currentPage" value="contact" />
<!-- Change value depending on page -->
<jsp:include page="header.jsp" />


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Contact Us - EazyCart</title>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/contact.css">
</head>
<body>

	<jsp:include page="header.jsp" />

	<section class="contact-section">
		<div class="contact-container">
			<h2>Contact Us</h2>
			<p>If you have any questions, suggestions, or feedback, feel free
				to reach out. We’d love to hear from you!</p>
			<c:if test="${not empty successMessage}">
				<p style="color: green; font-weight: bold;">${successMessage}</p>
			</c:if>

			<form action="submit-contact" method="post" class="contact-form">
				<div class="form-group">
					<label for="name">Name:</label> <input type="text" id="name"
						name="name" placeholder="Your full name" required>
				</div>

				<div class="form-group">
					<label for="email">Email:</label> <input type="email" id="email"
						name="email" placeholder="Your email address" required>
				</div>

				<div class="form-group">
					<label for="message">Message:</label>
					<textarea id="message" name="message"
						placeholder="Your message here..." rows="5" required></textarea>
				</div>

				<button type="submit" class="contact-btn">Send Message</button>
			</form>


			<div class="contact-info">
				<h3>Our Contact Info:</h3>
				<p>Email: support@eazycart.com</p>
				<p>Phone: +91-9876543210</p>
				<p>Location: Visakhapatnam, India</p>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp" />

</body>
</html>
