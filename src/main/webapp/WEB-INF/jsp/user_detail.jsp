<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp" %>

	<h1>${user.name} ${user.email }</h1>
	
	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Create Blog</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
	
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