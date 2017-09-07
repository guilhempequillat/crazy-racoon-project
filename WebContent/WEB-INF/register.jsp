<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
	<head>
		<link href="style.css" rel="stylesheet" type="text/css"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Registration</title>
	</head>
	<body>
		<div id="login-container">
			<h1>Registration</h1>
			<form action="register" method="POST">
				<input type="text" name="firstName" placeholder="First Name"/>
				<br/>
				<input type="text" name="lastName" placeholder="Last Name"/>
				<br/>
				<input type="submit" class="btn" value="Register"/>
			</form>
		</div>
	</body>
</html>