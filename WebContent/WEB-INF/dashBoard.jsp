<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="style.css" rel="stylesheet" type="text/css">
		<title>Dashboard</title>
	</head>
	<body>
		<div id="login-container">
			<h1>Hello ${user.firstName}</h1>
			There are currently ${liveUserCount} users connected to the platform.
		</div>
	</body>
</html>