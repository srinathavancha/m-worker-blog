<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	$('.action-remove-user').click(function(e){
		e.preventDefault();
		$('#modal-remove-user .action-confirm-removeuser').attr('href', $(this).attr('href'));
		$('#modal-remove-user').modal()
	});
});
</script>
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
						<a href='<spring:url value="/users/remove/${user.id}.html"></spring:url>' class="btn btn-danger action-remove-user">Remove</a>
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


<!-- Modal -->
<div class="modal fade" id="modal-remove-user" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Remove User</h4>
      </div>
      <div class="modal-body">
        Confirm to remove user ?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <a class="btn btn-danger action-confirm-removeuser">Ok</a>
      </div>
    </div>
  </div>
</div>