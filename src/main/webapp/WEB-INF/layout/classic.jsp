<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="taglib.jsp" %>
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
<%-- <title><tiles:getAsString name="title"></tiles:getAsString></title> --%>
<style type="text/css">
body {
		padding-top: 10px;
}
form {
		max-width: 450px;
		padding: 15px;
		margin: 0 auto;
}
.bg-strip {
	padding: 5px;
	background: none;
	border-bottom: 5px solid #dbdbdb ;
}
.alert {
    padding: 6px 12px;
}
.bg-message{
	margin: 5px;
    border: 1px solid #cfcfcf;
    font-weight: bold;
    color: rgba(217, 79, 130, 0.95);	
}
.title-bar {
    padding: 5px;
    background: #cfc;
}
.title-message{
    text-align: center;
    padding: 5px;	
}
</style>
</head>
<body>
<tilesx:useAttribute name="current"/>
	<div class="container">
		<!-- Static navbar -->
		<nav class="navbar navbar-default">
				<div class="container-fluid">
						<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
										aria-expanded="false" aria-controls="navbar">
										<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span>
										<span class="icon-bar"></span>
								</button>
								<a class="navbar-brand" href='<spring:url value="/#"></spring:url>'>MwB</a>
						</div>
						<div id="navbar" class="navbar-collapse collapse">
								<ul class="nav navbar-nav">
<%-- 										<li class="${current == 'index'? 'active': '' }"><a href='<spring:url value="/"></spring:url>'>Home</a></li> --%>
										<security:authorize access="hasRole('ROLE_ADMIN')">
											<li class="${current == 'users'? 'active': '' }"><a href='<spring:url value="/users.html"></spring:url>'>Users</a></li>
										</security:authorize>
								</ul>
    							<ul class="nav navbar-nav navbar-right">
										<security:authorize access="! isAuthenticated()">
										<li class="${current == 'register'? 'active': '' }"><a href='<spring:url value="/register.html"></spring:url>'>Register</a></li>
										<li class="${current == 'login'? 'active': '' }"><a href='<spring:url value="/login.html"></spring:url>'>Login</a></li>
										</security:authorize>
										<security:authorize access="isAuthenticated()">
											<li class="${current == 'account'? 'active': '' }"><a href='<spring:url value="/account.html"></spring:url>'>My Account</a></li>
											<li><a href='<spring:url value="/logout"></spring:url>'>Logout</a></li>												
										</security:authorize>    
    							</ul>								
						</div>
						<!--/.nav-collapse -->
				</div>
				<!--/.container-fluid -->
		</nav>
		<tiles:insertAttribute name="body"></tiles:insertAttribute>
		<br> <br>
		<center>
				<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		</center>
	</div>
</body>
</html>