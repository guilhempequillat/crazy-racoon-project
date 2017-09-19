<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Motm User Stat</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
</head>
<%@include file="header-user.jsp"%>
<body>

<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Report</h1>
				</div>
			
			</div>
	<div class="col-md-6 ">
		<!-- second part - stat -->
		<div class="row">
			<div class="col-md-12">

				<div class="row">
					<div class="col-xs-8 col-xs-offset-1">
						<div class="year">
							<strong>My Mood of the Year</strong>
						</div>
						<div class="sub_title">${Date}</div>
					</div>
				</div>

				<div class="details">
					<br>
					<div class="mood">
						<div class="row">
							<div class="col-xs-2">
								<div class="img-container">
									<img src="img/racoon1.jpg" alt="" class="img-responsive" />
								</div>
							</div>
							<div class="col-xs-9">
								<div class="progress-bar-container">
									<span class="desc">Vote count: ${Rate1}</span>
									<div class="progress">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="${Rate1}" aria-valuemin="0"
											aria-valuemax="100" style="width: ${Pourcent1}%">
											<span class="">${Pourcent1}%</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mood">
						<div class="row">
							<div class="col-xs-2">
								<div class="img-container">
									<img src="img/racoon2.jpg" alt="" class="img-responsive" />
								</div>
							</div>
							<div class="col-xs-9">
								<div class="progress-bar-container">
									<span class="desc">Vote count: ${Rate2}</span>
									<div class="progress">
										<div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="${Rate2}" aria-valuemin="0"
											aria-valuemax="100" style="width: ${Pourcent2}%">
											<span class="">${Pourcent2}%</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mood">
						<div class="row">
							<div class="col-xs-2">
								<div class="img-container">
									<img src="img/racoon3.jpg" alt="" class="img-responsive" />
								</div>
							</div>
							<div class="col-xs-9">
								<div class="progress-bar-container">
									<span class="desc">Vote count: ${Rate3}</span>
									<div class="progress">
										<div class="progress-bar progress-bar-midsuccess"
											role="progressbar" aria-valuenow="${Rate3}" aria-valuemin="0"
											aria-valuemax="100" style="width: ${Pourcent3}%">
											<span class="">${Pourcent3}%</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mood">
						<div class="row">
							<div class="col-xs-2">
								<div class="img-container">
									<img src="img/racoon4.jpg" alt="" class="img-responsive" />
								</div>
							</div>
							<div class="col-xs-9">
								<div class="progress-bar-container">
									<span class="desc">Vote count: ${Rate4}</span>
									<div class="progress">
										<div class="progress-bar progress-bar-neutral"
											role="progressbar" aria-valuenow="${Rate4}" aria-valuemin="0"
											aria-valuemax="100" style="width: ${Pourcent4}%">
											<span class="">${Pourcent4}%</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mood">
						<div class="row">
							<div class="col-xs-2">
								<div class="img-container">
									<img src="img/racoon5.jpg" alt="" class="img-responsive" />
								</div>
							</div>
							<div class="col-xs-9">
								<div class="progress-bar-container">
									<span class="desc">Vote count: ${Rate5}</span>
									<div class="progress">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="${Rate5}" aria-valuemin="0"
											aria-valuemax="100" style="width: ${Pourcent5}%">
											<span class="">${Pourcent5}%</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>

	<div class="col-md-6 ">

		<div class="row">
			<div class="col-xs-3 col-xs-offset-3">
				<img src="${Picture}" alt="" class="img-responsive" />
			</div>
			<div class="col-xs-6">

				<div class="title_mood">My Global Mood</div>
				<div class="note">
					<strong>${Average}/5 </strong>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-xs-10 col-xs-offset-1">
				<div class="comments">
					<h2>Comments</h2>

					<c:forEach items="${motms}" var="motm">
						<div class="comment-container">
							<div class="note">
								<img src="img/racoon${motm.grade}.jpg" class="mood" alt="" />
							</div>
							<div class="comment">${motm.comment}</div>
						</div>

					</c:forEach>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-offset-6">
				<nav>
				<ul class="pagination justify-content-end">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>

</body>
<%@include file="footer.jsp"%>
</html>