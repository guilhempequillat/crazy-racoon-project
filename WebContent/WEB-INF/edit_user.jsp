<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="style.css" rel="stylesheet">
	<script src="bootstrap/js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
</head>
<%@include file="header-user.jsp"%>
<body>
<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Edit User</h1>
				</div>
			</div>
   	<div class="row">
		<div class="col-md-6 col-md-offset-3">
		<c:if test="${not empty user }">
			<h2>Change your profile</h2>
				<div class="panel panel-login">
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="register-form" action="edit-user" method="POST" role="form">
									<div class="form-group">
										<input type="text" value="${user.firstName}" name="firstName" placeholder="First Name" id="firstname"  class="form-control" >
									</div>
									<div class="form-group">
										<input type="text" value="${user.lastName}" name="lastName" placeholder="Last Name" id="lastName"  class="form-control" >
									</div>
									<div class="form-group">
										<input type="email" value="${user.email}" name="email" id="email" class="form-control" placeholder="Email Address" >
									</div>
									<div class="form-group">
										<input type="date" value="${user.stringDate}" name="birthdate" placeholder="Birthdate" id="birthdate"  class="form-control" >
									</div>
									<div class="checkbox">
										<label><input id="passwordCheck" type="checkbox" name="doChangePassword" value="change"> Change Password</label>
										<c:if test="${not empty wrongPassword == true }">
											<c:if test="${ wrongPassword == true }">
												<p style="color : red;">Wrong password<p>
											</c:if> 
											<c:if test="${ wrongPassword == false }">
												<p style="color : green;">Password Edited<p>
											</c:if> 
										</c:if> 
									</div>
									<div id="passwordForm" style="display : none;">
										<div class="form-group">
											<input type="password" name="oldPassword" placeholder="Old Password"  class="form-control" >
										</div>
										<div class="form-group">
											<input type="password" name="newPassword" placeholder="New Password"  class="form-control" >
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-primary btn-block" value="Edit">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${empty user }">
				<h2>You are not connected !</h2>
			</c:if>
		</div>
	</div>
	<script>
		document.getElementById("passwordCheck").addEventListener("click",function(){
			if(document.getElementById("passwordCheck").checked) {
				document.getElementById("passwordForm").style.display="block";
			} else {
				document.getElementById("passwordForm").style.display="none";
			}
		});
	</script>
</body>
</html>