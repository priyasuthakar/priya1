<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@page isELIgnored="false"%>
<%@include file="/WEB-INF/views/Header.jsp"%>

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
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60" style="background-color: #E6E6FA">
	<div class="container">
		<c:forEach items="${productinfo}" var="product">
			<div class="col-sm-6">
				<br> <br> <br> <br>
				<div class="item">
					<img src="resource/images/${product.id}.jpg" style="height: 350px"
						class="img-responsive">
				</div>
			</div>
			<div class="col-sm-6">
				<br> <br> <br> <br> <b>ID
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:&nbsp&nbsp&nbsp</b>
				${product.id} <br> <br> <b>NAME
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:&nbsp&nbsp&nbsp</b>
				${product.name} <br> <br> <b>COLOR
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:&nbsp&nbsp&nbsp</b>
				${product.color} <br> <br> <b>PRICE
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:&nbsp&nbsp&nbsp</b>
				${product.price} <br> <br> <b>DISCRIPTION
					:&nbsp&nbsp&nbsp</b> ${product.discription} <br> <br> <br>
				<br> <br> <br> <a href="buy"><button
						onclick="myFunction()" class="btn btn-success">BUY NOW</button></a> <a
					href="<c:url value= '/cart${product.id}'/>"><button
						onclick="myFunction1()" class="btn btn-success">ADD TO
						CART</button></a>
				<script>
			function myFunction() {
				  var x = confirm("Are you sure you want to buy?");
			      if (x)
			          return true;
			      else
			        return false;
	}
		</script>
				<script>
			function myFunction1() {
				confirm("Press ok to add the item to cart!");
			}
		</script>
			</div>
		</c:forEach>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@include file="Footer.jsp"%>
</body>
</html>