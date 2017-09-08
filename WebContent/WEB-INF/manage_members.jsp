<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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


							<!-- @foreach($etudiants as $etudiant)-->
							<tr>
								<td>prenom</td>

								<td>nom...</td>
								<td>mail...</td>
								<td>birthdate...</td>

								<td><p data-placement="top" data-toggle="tooltip" title="Edit">
										<button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
									</p></td>
								<td><p data-placement="top" data-toggle="tooltip" title="Delete">
										<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
									</p></td>
							</tr>

							<!-- @endforeach -->

						</tbody>

					</table>
					<!-- pagination -->
					<div class="clearfix"></div>

				</div>

			</div>
		</div>



	<div class="modal fade" id="edit" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Edit Member</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input class="form-control " type="text" placeholder="First name">
					</div>
					<div class="form-group">

						<input class="form-control " type="text" placeholder="Last name">
					</div>
					<div class="form-group">

						<input class="form-control " type="mail" placeholder="Email">
					</div>
					<div class="form-group">

						<input class="form-control " type="date" placeholder="Birthdate">
					</div>

	
			</div>
			<div class="modal-footer ">
				<button type="button" class="btn btn-warning btn-lg"
					style="width: 100%;">
					<span class="glyphicon glyphicon-ok-sign"></span> Update
				</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
	<div></div>



	<div class="modal fade" id="delete" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
				</div>
				<div class="modal-body">

					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?
					</div>

				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-success">
						<span class="glyphicon glyphicon-ok-sign"></span> Yes
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> No
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<br>


	</div>
	
	
	<div class="container">
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add a member</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Add a new member</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input class="form-control " type="text" placeholder="First name">
					</div>
					<div class="form-group">

						<input class="form-control " type="text" placeholder="Last name">
					</div>
					<div class="form-group">

						<input class="form-control " type="mail" placeholder="Email">
					</div>
					<div class="form-group">
					<input class="form-control " type="text" placeholder="Password">
					</div>
					<div class="form-group">

						<input class="form-control " type="date" placeholder="Birthdate">
					</div>

			
			</div>
			<div class="modal-footer ">
				<button type="button" class="btn btn-warning btn-lg"
					style="width: 100%;">
					<span class="glyphicon glyphicon-ok-sign"></span> Add
				</button>
			</div>
      
    </div>
  </div>
	<!--  
	<c:forEach items = "${users}" var = "user">
		<h1>Hello ${user.firstName} ${user.birthdate}</h1>
	</c:forEach>-->
</body>
</html>
