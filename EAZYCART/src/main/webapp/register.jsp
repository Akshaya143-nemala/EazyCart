<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="currentPage" value="register" />       <!-- Change value depending on page -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - EazyCart</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="login-box">
		<img src="images/logo.png" alt="EazyCart Logo" class="logo">
		<h2>Register</h2>

		<!-- Error message -->
		<c:if test="${not empty error}">
			<p style="color: red; font-weight: bold;">${error}</p>
		</c:if>

		<form action="RegisterServlet" method="post">
			<div class="input-group">
				<label for="name">Full Name</label>
				<input type="text" name="name" id="name" required>
			</div>

			<div class="input-group">
				<label for="email">Email</label>
				<input type="email" name="email" id="email" required>
			</div>

			<div class="input-group">
				<label for="phone">Phone Number</label>
				<input type="text" name="phone" id="phone" required>
			</div>

			<div class="input-group">
				<label for="password">Password</label>
				<input type="password" name="password" id="password" required>
			</div>

			<div class="input-group">
				<label for="confirmPassword">Confirm Password</label>
				<input type="password" name="confirmPassword" id="confirmPassword" required>
			</div>

			<button type="submit">Register</button>
		</form>

		<div class="signup-link">
			Already have an account? <a href="login.jsp">Login here</a>
		</div>
	</div>
</body>
</html>
