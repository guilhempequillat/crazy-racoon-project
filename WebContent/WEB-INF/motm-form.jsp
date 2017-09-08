<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="panel-body">
   	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<h2>What is your mood this mounth ?</h2>
			<form action="motm-form" method="POST" role="form">
				<div class="form-group">
					<label>Grade : </label>
					<input type="number" name="grade" placeholder="1-5" class="form-control">
				</div>
				<div class="form-group">
				<label>Comment : </label>
					<textarea name="comment" placeholder="Comment" class="form-control">Your comment ...
					</textarea>
				</div>
				<div class="col-sm-6 col-sm-offset-3">
					<input type="submit" value="Send" class="form-control btn btn-primary btn-block">
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>