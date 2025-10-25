<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
   <%
    response.sendRedirect("home");
%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="currentPage" value="index" />       <!-- Change value depending on page -->
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test DB Connection</title>
</head>
<body>
<body>
    <h2>Testing JDBC Connection</h2>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/eazycart", // Change this
                "root",                            // Change this
                "3009"                             // Change this
            );
            out.println("✅ JDBC Connection Successful!");
        } catch (Exception e) {
            out.println("❌ Error: " + e);
        }
    %>
</body>
</html>