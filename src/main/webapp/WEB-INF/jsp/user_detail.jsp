<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp" %>

	<h1>${user.name} ${user.email }</h1>
	
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