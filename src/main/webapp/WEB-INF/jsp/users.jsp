<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp" %>
<c:choose>
<c:when test="${not empty users}">
	<table class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>Username</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users}" var="user">
				<tr>
					<td>
						<a href='<spring:url value="/users/${user.id}.html"></spring:url>'>${user.name}</a>
					</td>
					<td>
						<a href='<spring:url value="/users/remove/${user.id}.html"></spring:url>' class="btn btn-danger">Remove</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:when>
<c:otherwise>
	<div class="bg-message">
		<div class="title-bar">Message</div>
		<div class="title-message">No Users.</div>
	</div>
</c:otherwise>
</c:choose>