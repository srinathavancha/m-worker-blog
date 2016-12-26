<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp" %>
<div class="container">
	<form:form modelAttribute="user" cssClass="form-horizontal">
	
		<c:if test="${param.success eq true }">
			<div class="alert alert-success">Registration Successfull.</div>
		</c:if>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">Name:</label>
			<div class="col-sm-10">
				<form:input path="name" cssClass="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">Email:</label>
			<div class="col-sm-10">
				<form:input path="email" cssClass="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="password" class="col-sm-2 control-label">Password:</label>
			<div class="col-sm-10">
				<form:password path="password" cssClass="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<input type="submit" value="Submit" class="btn btn-lg btn-primary btn-block"/>
			</div>
		</div>
	</form:form>
</div>