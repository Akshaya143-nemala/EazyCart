<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="currentPage" value="login" />       <!-- Change value depending on page -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - EazyCart</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="background">
        <div class="login-box">
            <img src="images/logo.png" alt="EazyCart Logo" class="logo">
            <h2>Login</h2>

            <!-- Show error message if login failed -->
            <%
                String error = request.getParameter("error");
                if ("invalid".equals(error)) {
            %>
                <p class="error-msg">Invalid email or password.</p>
            <%
                }
            %>

            <!-- Show success message if redirected from register -->
            <%
                String successMsg = (String) request.getAttribute("msg");
                if (successMsg != null) {
            %>
                <p class="success-msg"><%= successMsg %></p>
            <%
                }
            %>

            <!-- Login form -->
            <form action="LoginServlet" method="post">
                <div class="input-group">
                    <input type="email" name="email" required>
                    <label>Email</label>
                </div>
                <div class="input-group">
                    <input type="password" name="password" required>
                    <label>Password</label>
                </div>

                <button type="submit">Login</button>

                <p class="signup-link">New user? <a href="register.jsp">Register here</a></p>
                <a href="forgotPassword.jsp" class="forgot-password-link">Forgot Password?</a>
            </form>
        </div>
    </div>
</body>
</html>
