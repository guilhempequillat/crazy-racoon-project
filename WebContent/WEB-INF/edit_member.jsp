<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin-Edit Member</title>
</head>
<%@include file="header-admin.jsp"%>
<body>
	<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Edit Members</h1>
				</div>
			
			</div>
        <div class="panel-body">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="register-form" action="edit-member" method="POST" role="form">
									<div class="form-group">
										<input type="text" value="${userEdit.firstName}" name="firstName" placeholder="First Name" id="firstname"  class="form-control" >
									</div>
									<div class="form-group">
										<input type="text" value="${userEdit.lastName}" name="lastName" placeholder="Last Name" id="lastName"  class="form-control" >
									</div>
									<div class="form-group">
										<input type="email" value="${userEdit.email}" name="email" id="email" class="form-control" placeholder="Email Address" >
									</div>
									<div class="form-group">
										<input type="date" value="${userEdit.stringDate}" name="birthdate" placeholder="Birthdate" id="birthdate"  class="form-control" >
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
    
   
</div>
</body>
<%@include file="footer.jsp"%> 
</html>