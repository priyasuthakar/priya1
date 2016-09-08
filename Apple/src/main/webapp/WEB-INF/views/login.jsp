<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
body {
	background-image: url("/resource/images/a.jpg");
}
h1 {
	font-size: 24px;
	color: #303030;
	font-weight: 600;
	margin-bottom: 30px;
	font-size: 24px;
}

.navbar {
	background-color: #660033;
	font-size: 18px !important;
}

.navbar .navbar-brand {
	color: #FFFFFF !important;
}

.navbar .li a {
	color: #FFF !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: #660033 !important;
	background-color: #FFCCCC !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #FFCCCC !important;
}

footer .glyphicon {
	font-size: 24px;
	margin-bottom: 20px;
	color: #660033;
}

@media screen and (max-width: 768px) {
	.col-lg-4 {
		text-align: center;
		margin: 25px 0;
	}
	.btn-lg {
		width: 100%;
		margin-bottom: 35px;
	}
}

@media screen and (max-width: 480px) {
	.logo {
		font-size: 150px;
	}
}

</style>

</head>
<body id="log" style="background-color: #b3ffb3">
<%@include file="Header.jsp"%>
	<font face="Harlow Solid Italic"><h1>${successMessage}</h1></font>
	<font face="Harlow Solid Italic"><h1>${errorMessage}</h1></font>

	<center>
		<font face="Harlow Solid Italic"><h1>Sign-in</h1></font> <br> <br>
		<br> <br> <br> <br>
		<div class="container">
			<form action="login" method="post" class="form-horizontal"
				role="form">
				<center>
					<div class="form-group">
						<label class="col-lg-4 control-label">User Name</label>
						<div class="col-lg-4 ">
							<input class="form-control" type="text" name="username"
								placeholder="Enter user name" required="true"
								title="should not be empty" />
						</div>
					</div>
					<br> <br>
					<div class="form-group">
						<label class="col-lg-4 control-label">Password</label>
						<div class="col-lg-4 ">
							<input class="form-control" type="password" name="password"
								placeholder="Enter password" required="true"
								title="should not be empty" />
						</div>
					</div>
					<br> <br>
				</center>
				<div class="checkbox">
					<label><input type="checkbox"> Remember me</label>
				</div>
				<br>
				<div>
					<input type="submit" class="btn btn-success" /> <input
						type="reset" class="btn btn-info" />
				</div>
				<br>
				<div>
					<a href="reg"><input type="button" class="btn btn-link" />new
						user?</a>
				</div>
				<br> <br> <input type="hidden"
					name="${_csrf.parameterName }" value="${_csrf.token}" />
			</form>
		</div>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>