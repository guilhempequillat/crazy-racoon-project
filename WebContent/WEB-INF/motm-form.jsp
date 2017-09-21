<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Motm Form</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
</head>
<%@include file="header-user.jsp"%>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">MOTM Form</h1>
		</div>

	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-xs-offset-3">
				<c:if test="${not empty user }">
					<c:if test="${not empty template }">
						<h2 align="center">
							<strong>Hi ${ user.firstName } ! </strong> <br> ${ template.title }
						</h2>
						<p>${ template.text }</p>
					</c:if>
					<c:if test="${empty template }">
						<h2 align="center">
							<strong>Hi ${ user.firstName } ! </strong> <br>
						</h2>
					</c:if>
					<form action="motm-form" method="POST" role="form">
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
						<input type="submit" value="Send" id="btn"
							class="form-control btn btn-primary btn-block">
					</form>
				</c:if>
				<c:if test="${empty user }">
					<h1>You are not connected !!!</h1>
				</c:if>
				<div>
					<c:if test="${not empty motm }">
						<div class="row">
							<br>
							<div class="col-xs-3">
								<div class="thumbnail">
									<img src="img/racoon${ motm.grade }.jpg" class="img-responsive"
										alt="">
								</div>
								<!-- /thumbnail -->
							</div>
							<div class="col-xs-9">
								<div class="panel panel-default">
									<div class="panel-heading">
										<strong>${ user.firstName  }</strong> <span class="text-muted">
											commented <c:choose>
												<c:when test="${year > 0 }">
													<c:if test="${year > 1 }">
											 		${ year } years ago
										</span>
					</c:if>
					<c:if test="${year == 1 }">
											 		${ year } year ago</span>
					</c:if>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${month > 0 }">
								<c:if test="${month > 1 }">
												 		${ month } months ago</span>
								</c:if>
								<c:if test="${month == 1 }">
												 		${ month } month ago</span>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${day >= 0 }">
										<c:if test="${day > 1 }">
														 		${ day } days ago</span>
										</c:if>
										<c:if test="${day == 1 }">
														 		yesterday</span>
										</c:if>
										<c:if test="${ day == 0 }">
														 		today</span>
										</c:if>
									</c:when>
									<c:otherwise>
										</span>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
					</c:choose>
				</div>
				<div class="panel-body">
					<p>${ motm.comment }</p>
				</div>
				<!-- /panel-body -->
			</div>
			<!-- /panel panel-default -->
		</div>
	</div>
	</c:if>
	</div>
	</div>
	</div>
	</div>
	<script type="text/javascript">
		$('#btn').click(function() {
			$(this).val('Edit');
		});
	</script>

	<div></div>
</body>
<%@include file="footer.jsp"%>
</html>