<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="style.css" rel="stylesheet" type="text/css">
		<title>Admin-Manage Member</title>
	</head>
	<body>
	<c:out value = "${countMembers}"/>
	<c:forEach items = "${users}" var = "user">
		<c:out value = "${user}"/>
		<h1>Hello ${user.firstName} ${user.birthdate}</h1>
	</c:forEach>
	</body>
</html>