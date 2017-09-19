<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	
	
    <!-- Bootstrap CSS -->
   <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="style.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    
</head>
<body>
<form action="mail" method="post">
<input type="submit" name="button1" value="Button 1" />
</form>


<div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-cog fa-fw"></i> Settings
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table settings">
                                <tbody>
                                    <tr>
                                        <td>Mailing Date</td>
                                        <td>Last friday of each month</td>
                                    </tr>
                                    <tr>
                                        <td>Time </td>
                                        <td>10:00</td>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table editsettings hidden">
                                <tbody>
                                <tr>
                                    <td>Mailing Date</td>
                                    <td>
                                        <select name="date" class="form-control" id="senddate">
                                            <option value="1">Last friday of each month</option>
                                            <option value="2">Last office-day of each month</option>
                                            <option value="3">First monday of each month</option>
                                            <option value="4">First office-day of each month</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Time </td>
                                    <td><input type="text" class="form-control"></td>
                                </tr>
                                <tr><td colspan="2" align="right"><input type="submit" class="btn btn-sm btn-primary"></td></tr>
                                </tbody>
                            </table>

                            <!-- /.list-group -->
                            <a class="btn btn-default btn-block edit">Change Settings</a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
</body>
</html>