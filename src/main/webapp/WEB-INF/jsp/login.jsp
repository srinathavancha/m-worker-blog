<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
		<form class="form-signin form-horizontal" role="form" action="/j_spring_security_check" method="POST">
				<h2 class="form-signin-heading  bg-strip">Sign in</h2>
				<!-- 				username -->
				<div class="form-group">
						<label for="username" class="sr-only">Username</label>
						<div class="col-sm-12">
								<input class="form-control" name="j_username" type="text" id="username" class="form-control" placeholder="Username" required
										autofocus>
						</div>
				</div>
				<!-- 				password -->
				<div class="form-group">
						<label for="inputPassword" class="sr-only">Password</label>
						<div class="col-sm-12">
								<input class="form-control" name="j_password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
						</div>
				</div>
				<!-- 				submit -->
				<div class="form-group">
						<div class="col-sm-12">
								<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
						</div>
				</div>
		</form>
</div>
<!-- /container -->

