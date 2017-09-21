<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Template Editor</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
</head>
<%@include file="header-admin.jsp"%>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Edit MOTM Template</h1>
		</div>

	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-xs-offset-3">
				<h1>Edit Template</h1>
				<form action="edit-template" method="POST" role="form">
					<div class="form-group">
						<label>Title</label> <input type="text" name="title"
							placeholder="Title" class="form-control">
					</div>
					<div class="form-group">
						<label>Text</label>
						<textarea type="text" name="text" placeholder="Text" clos=""
							rows="" class="form-control"></textarea>
					</div>
					<input type="submit" value="Save"
						class="form-control btn btn-primary btn-block">
				</form>
				<c:if test="${not empty template }">
					<p>Last modification : ${ template.date }</p>
					<br>
					<br>
					<h2 align="center">
						<strong>Hi "User name" ! </strong> <br> ${ template.title }
					</h2>
					<p>${ template.text }</p>
					<form action="#" role="form">
						<div class="form-group">
							<label>Grade : </label>
							<div class="row">
								<div class="col-xs-2 col-xs-offset-1">
									<input type="radio" class="radio_item" name="grade" value="1"
										id="radio1"> <label class="label_item" for="radio1">
										<img src="img/racoon1.jpg" class="img-responsive" alt="">
									</label>
								</div>
								<div class="col-xs-2">
									<input type="radio" class="radio_item" name="grade" value="2"
										id="radio2"> <label class="label_item" for="radio2">
										<img src="img/racoon2.jpg" class="img-responsive" alt="">
									</label>
								</div>
								<div class="col-xs-2">
									<input type="radio" class="radio_item" name="grade" value="3"
										id="radio3"> <label class="label_item" for="radio3">
										<img src="img/racoon3.jpg" class="img-responsive" alt="">
									</label>
								</div>
								<div class="col-xs-2">
									<input type="radio" class="radio_item" name="grade" value="4"
										id="radio4"> <label class="label_item" for="radio4">
										<img src="img/racoon4.jpg" class="img-responsive" alt="">
									</label>
								</div>
								<div class="col-xs-2">
									<input type="radio" class="radio_item" name="grade" value="5"
										id="radio5"> <label class="label_item" for="radio5">
										<img src="img/racoon5.jpg" class="img-responsive" alt="">
									</label>
								</div>

							</div>
						</div>
						<div class="form-group">
							<label>Comment : </label>
							<textarea name="comment" placeholder="Comment"
								class="form-control" cols="" rows=""></textarea>
						</div>
						<input type="button" value="Send" id="btn"
							class="form-control btn btn-primary btn-block">
					</form>
					<br>
					<br>
				</c:if>
				<c:if test="${empty template }">
					There is not template yet !
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>