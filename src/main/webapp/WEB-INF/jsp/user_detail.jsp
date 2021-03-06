<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp" %>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#blog-tabs a:first').tab('show') // Select first tab
		$('.action-remove-blog').click(function(e){
			e.preventDefault();
			$('#modal-remove-blog .action-confirm-removeblog').attr('href', $(this).attr('href'));
			$('#modal-remove-blog').modal()
		});
	});
	</script>
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

	<c:choose>
	<c:when test="${not empty user.blogs}">
		<div>
		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist" id="blog-tabs">
		  	<c:forEach items="${user.blogs }" var="blog">
		    	<li role="presentation"><a href="#blog-${blog.id}" 
		    	aria-controls="blog-${blog.id}" role="tab" data-toggle="tab">${blog.name}</a></li>
		    </c:forEach>
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
				<c:forEach items="${user.blogs }" var="blog">
					<div role="tabpanel" class="tab-pane" id="blog-${blog.id }">
						<h1>${blog.name }</h1>
						<p>
						<a href='<spring:url value="/blog/remove/${blog.id}.html"></spring:url>' class="btn btn-danger action-remove-blog">Remove</a>
						${blog.url }
						</p>

						<c:choose>
						<c:when test="${not empty blog.items}">						
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
						</c:when>
						<c:otherwise>
							<div class="bg-message">
								<div class="title-bar">Message</div>
								<div class="title-message">No Blog Entries.</div>
							</div>
						</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>	  
		  </div>
		</div>		
	</c:when>
	<c:otherwise>
		<div class="bg-message">
			<div class="title-bar">Message</div>
			<div class="title-message">No Blogs.</div>
		</div>
	</c:otherwise>
	</c:choose>
	
	
	
<!-- Modal -->
<div class="modal fade" id="modal-remove-blog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Remove Blog</h4>
      </div>
      <div class="modal-body">
        Confirm to remove blog ?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <a class="btn btn-danger action-confirm-removeblog">Ok</a>
      </div>
    </div>
  </div>
</div>