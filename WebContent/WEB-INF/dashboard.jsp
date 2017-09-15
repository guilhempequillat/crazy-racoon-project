<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="style.css" rel="stylesheet" type="text/css">
		<title>Dashboard</title>
	</head>
	<%@include file="header.jsp"%>
	<body>
		<div id="login-container">
			<h1>Hello ${user.firstName} ${user.birthdate}</h1>
			There are currently ${liveUserCount} users connected to the platform.
		</div>
	</body>
	<%@include file="footer.jsp"%> 
</html>