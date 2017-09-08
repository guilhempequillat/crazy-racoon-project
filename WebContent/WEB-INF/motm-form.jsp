<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Motm Form</title>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="panel-body">
   	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<c:if test="${not empty user }">
			<h2>Hi ${ user.firstName } ! What is your mood this mounth ?</h2>
			<form action="motm-form" method="POST" role="form">
				<div class="form-group">
					<label>Grade : </label>
					<div class="row">
						<div class="col-xs-10 col-xs-offset-1">
							<div class="col-xs-2">
								<input type="radio" name="grade" value="1"> 1
							</div>
							<div class="col-xs-2">
								<input type="radio" name="grade" value="2"> 2
							</div>
							<div class="col-xs-2">
								<input type="radio" name="grade" value="3" checked> 3
							</div>
							<div class="col-xs-2">
								<input type="radio" name="grade" value="4"> 4
							</div>
							<div class="col-xs-2">
								<input type="radio" name="grade" value="5"> 5
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
				<label>Comment : </label>
					<textarea name="comment" placeholder="Comment" class="form-control"></textarea>
				</div>
				<div class="col-sm-6 col-sm-offset-3">
					<input type="submit" value="Send" class="form-control btn btn-primary btn-block">
				</div>
			</form>
			</c:if>
			<c:if test="${empty user }">
				<h1>You are not connected !!!</h1>
			</c:if>
		</div>
		
	</div>
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<c:if test="${not empty motm }">
				<div class="row">
					<label>Grade : </label>${ motm.grade }
				</div>
				<div class="row">
					<label>Comment : </label><p>${ motm.comment }</p>
				</div>
			</c:if> 
		</div>
	</div>
</div>

</body>
</html>