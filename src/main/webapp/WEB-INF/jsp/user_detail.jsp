<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp" %>

	<h1>${user.name} ${user.email }</h1>
	
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	  Create Blog
	</button>
	<!-- Do take care whiile adding modelAttribute 
	otherwise: face run time exception: eg: org.springframework.beans.NotReadablePropertyException: Invalid property 'url' of bean class 
	[com.srinathavan.mwb.entity.User]: Bean property 'url' is not readable or has an invalid getter method: 
	Does the return type of the getter match the parameter type of the setter? --> 
	<form:form modelAttribute="blog" cssClass="form-horizontal">
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Create Blog</h4>
	      </div>
	      <div class="modal-body">
			<div class="form-group">
				<div class="col-sm-2">
					<label for="name" class="control-label">Name:</label>
				</div>
				<div class="col-sm-10">
					<form:input path="name" cssClass="form-control"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-2">
					<label for="name" class="control-label">Url:</label>
				</div>
				<div class="col-sm-10">
					<form:input path="url" cssClass="form-control"/>
				</div>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <input type="submit" class="btn btn-primary" value="Save">
	      </div>
	    </div>
	  </div>
	</div>
	</form:form>

	<c:forEach items="${user.blogs }" var="blog">
		<h1>${blog.name }</h1>
		<p>${blog.url }</p>
		
		<table class="table table-bordered table-hover table-stripped">
			<thead>
				<tr>
					<th>Title</th>
					<th>URL</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${blog.items }" var="item">
					<tr>
						<td>${item.title}</td>
						<td>${item.link}</td>
					</tr>				
				</c:forEach>
			</tbody>
		</table>
	</c:forEach>