<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin-Manage Member</title>
</head>
<body>


	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h4>Manage Members</h4>
				<div class="table-responsive">


					<table id="mytable" class="table table-bordred table-striped">

						<thead>

							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Birthdate</th>
							<th>Edit</th>
							<th>Delete</th>
						</thead>
						<tbody>


							<c:forEach items="${users}" var="user">
								<tr>
									<td>${user.firstName}</td>
									<td>${user.lastName}</td>
									<td>${user.email}</td>
									<td>${user.stringDate}</td>

									<td><form action="edit-member" method="GET">
											<input type="text" value="${user.id}" name="editbutton" style="display:none;">
											<input type="submit" class="class="icon-edit"">
										</form></td>
									<td><form action="manage-members" method="POST">
											<input type="text" value="${user.id}" name="removebutton" style="display:none;">
											<input type="submit" class="glyphicon glyphicon-pencil">
										</form></td>
								</tr>
							</c:forEach>

						</tbody>

					</table>
					<!-- pagination -->
					<div class="clearfix"></div>

				</div>

			</div>
		</div>


	</div>


	<div class="container">
		<a href="add-member" class="btn btn-info btn-lg">Add a member</a>
	</div>
</body>
</html>
