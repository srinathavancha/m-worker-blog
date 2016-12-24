<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
		integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
		integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"
		integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"></tiles:getAsString></title>
</head>
<body>
		<div class="container">


				<!-- Static navbar -->
				<nav class="navbar navbar-default">
				<div class="container-fluid">
						<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
										aria-expanded="false" aria-controls="navbar">
										<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
												class="icon-bar"></span>
								</button>
								<a class="navbar-brand" href="#">Work Blog</a>
						</div>
						<div id="navbar" class="navbar-collapse collapse">
								<ul class="nav navbar-nav">
										<li class="active"><a href='<spring:url value="/"></spring:url>'>Home</a></li>
										<li><a href="#">About</a></li>
										<li><a href="#">Contact</a></li>
								</ul>
						</div>
						<!--/.nav-collapse -->
				</div>
				<!--/.container-fluid --> </nav>
				<tiles:insertAttribute name="body"></tiles:insertAttribute>
				<br> <br>
				<center>
						<tiles:insertAttribute name="footer"></tiles:insertAttribute>
				</center>
		</div>
</body>
</html>