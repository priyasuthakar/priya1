<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Shopping</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!--Angularjs library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
.navbar {
	background-color: #660033;
	font-size: 16px !important;
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

table {
	border-collapse: collapse;
}

table, tr, th, td {
	border: 2px solid black;
}

table {
	padding-left: 50%
}
</style>
</head>

<body>
	<%@ include file="Header.jsp"%>
	<br>
	<div class="container">
		<div align="left">
			<h4>
				<b>${CartList}</b>
			</h4>
		</div>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th width="100">CARTID</th>
					<th width="200">PRODUCTNAME</th>
					<th width="200">QUANTITY</th>
					<th width="100">PRICE</th>
					<th width="100">Delete</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${cartList}" var="cart">
					<tr>

						<td>${cart.id}</td>
						<td>${cart.pname}</td>
						<td>${cart.quantity}</td>
						<td>${cart.price}</td>

						<td><a href=" <c:url value="/del${cart.id}"/>">DELETE</a></td>
					</tr>
				</c:forEach>




			</tbody>
		</table>
		<br> <br><%-- 
		<h4>
			<b>TOTAL Amount : ${totalsize }</b>
		</h4> --%>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>