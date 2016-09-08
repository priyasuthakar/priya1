<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="/WEB-INF/views/AdminHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product Admin</title>
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
h1 {
	font-size: 24px;
	color: #303030;
	font-weight: 600;
	margin-bottom: 30px;
	font-size: 24px;
}

.navbar {
	margin-bottom: 0;
	background-color: #622569;
	z-index: 9999;
	border: 0;
	font-size: 18px !important;
	line-height: 1.42857143 !important;
	letter-spacing: 2px;
	border-radius: 0;
	font-family: Montserrat, sans-serif;
}

.navbar .navbar-brand {
	color: #FFFFFF !important;
}

.navbar .li a {
	color: #FFF !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: #622569 !important;
	background-color: violet !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #FFCCCC !important;
}

footer .glyphicon {
	font-size: 24px;
	margin-bottom: 20px;
	color: #622569;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
	margin: auto;
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
<body ng-app="productapp" ng-controller="productCtrl">
	<br>
	<font face="Harlow Solid Italic"><h1>${addproduct}</h1></font>
	<font face="Harlow Solid Italic"><h1>${editproduct}</h1></font>
	<font face="Harlow Solid Italic"><h1>Product List</h1></font>
	<table class="table table-striped">
		<thead>
			<tr>
				<th width="120">ID</th>
				<th width="120">NAME</th>
				<th width="120">COLOR</th>
				<th width="120">PRICE</th>
				<th width="100">CAT_ID</th>
				<th width="100">SUP_ID</th>
				<th width="120">DiSCRIPTION</th>
				<th width="120">EDIT</th>
				<th width="120">DELETE</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="plist in product | filter:searchbox ">
				<td>{{plist.id}}</td>
				<td>{{plist.name}}</td>
				<td>{{plist.color}}</td>
				<td>{{plist.price}}</td>
				<td>{{plist.cat.id}}</td>
				<td>{{plist.sup.id}}</td>
				<td>{{plist.discription}}</td>
				<td><a href="<c:url value="/edit2{{plist.id}}"/>"
					ng-click="enableEditor()">Edit</a></td>
				<td><a href="<c:url value="/p{{plist.id}}"/>"
					ng-click="remove()">Delete</a></td>
			</tr>
		</tbody>
	</table>
	<script type="text/javascript">
		var p = ${listp};
		var productapp = angular.module("productapp", []);
		productapp.controller("productCtrl", function($scope, $http) {
			$scope.product = p;
		});
	</script>
	<%@include file="Footer.jsp"%>
</body>
</html>