<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cab"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html5 PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<cab:headImports />
<title>Forget Password</title>
</head>
<body>

	<cab:nav />
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-4 text-center">
				<div class="card">
					<div class="card-header">
						<strong>Change your Password</strong>
					</div>
					<div class="card-body">
						<form:form method="post" 
							action="team5cab/public/changepassword" modelAttribute="Users">
							<div class="form-group">
								<p>New Password:</p>
								<form:input name="password" required="required" type="password"
									id="password" path="password" />
								<form:hidden path="userID"/>
								<form:hidden path="name"/>
								<form:hidden path="email"/>
								<form:hidden path="address"/>
								<form:hidden path="phoneNumber"/>
								<form:hidden path="dob"/>
								<form:hidden path="role"/>
							</div>
							<div class="form-group">
								<p>Confirm New Password:</p>
								<input name="password_confirm" required="required"
									type="password" id="password_confirm" oninput="check(this)" />
							</div>
							<script language='javascript' type='text/javascript'>
								function check(input) {
									if (input.value != document
											.getElementById('password').value) {
										input
												.setCustomValidity('Password Must be Matching.');
									} else {
										// input is valid -- reset the error message
										input.setCustomValidity('');
									}
								}
							</script>
							<div class="form-group">
							    <a href="/team5cab/public/login" class="btn btn-secondary">Cancel</a>
								<input type="submit" class="btn btn-primary" value="Ok" />
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>