<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
	<head>
	
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	
	<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>Registration</title>
	</head>
	
	<body>
      <c:if test = "${connect == false}">
       	 <div class="alert alert-danger">
 	 	<strong>Error!</strong> Password or Email invalid ${connect}
		</div>
      </c:if>
	
	<br>
	<br>
	<br>
	<br>
        <div class="panel-body">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link" text-align="center">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="connection" method="POST" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="email" id="email" tabindex="1" class="form-control" placeholder="Email" >
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
								
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-primary btn-block btn-login" value="Log In">
											</div>
										</div>
									</div>
									
								</form>
								<form id="register-form" action="register" method="POST" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="firstName" placeholder="First Name" id="firstname"  class="form-control" >
									</div>
									<div class="form-group">
										<input type="text" name="lastName" placeholder="Last Name" id="lastName"  class="form-control" >
									</div>
									<div class="form-group">
										<input type="email" name="email" id="email" class="form-control" placeholder="Email Address" >
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										<input type="date" name="birthdate" placeholder="Birthdate" id="birthdate"  class="form-control" >
									</div>
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-primary btn-block" value="Register Now">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
              
        </div>

    <div class="col-md-12" style="margin-top:20px;text-align: center">    
    </div>
    
    
    
    <a id="mailModal" class="col-md-12" style="text-align: center"> Mot de pas oublié ? </a>
</div>

<script>
$(function() {

    $('#login-form-link').click(function(e) {
		$("#login-form").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});

});
</script>

	</body>
</html>