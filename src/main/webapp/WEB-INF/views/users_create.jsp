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
<script>
  $( function() {
	    $( "#datepicker" ).datepicker({ minDate: -"200M", maxDate: "+0D" });
	  } );
	  </script>
<title>Add new user</title>
</head>
<body>
<cab:nav />
	<div class="container text-left">
		<h1 class="text-center">Add new user</h1>
		<div class="card mt-5">

			<form:form action="team5cab/admin/user/create" method="post" class="col-12 card-body justify-content-center needs-validation"  modelAttribute="Users">
					<p class="text-muted font-italic mb-0 pb-0">UserID</p>

			
					<div class="input-group mb-3">
						<form:input type="text" class="form-control" aria-label="User ID" aria-describedby="inputGroup-sizing-default" placeholder="User ID"
						path="userID"	required="required"/>
						<div class="invalid-feedback mb-3">
							Please provide userID
						</div>
					</div>
	                 <p class="text-muted font-italic mb-0 pb-0">UserName</p>
					<div class="input-group mb-3">
						<form:input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Name"
						path="name"	required="required"/>
						<div class="invalid-feedback mb-3">
							Please provide Name.
						</div>
					</div>
	                <p class="text-muted font-italic mb-0 pb-0">Email</p>
					<div class="input-group mb-3">
						<form:input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Email"
							path="email" required="required" id="Email" onblur="validateEmail(this);"/>
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">@example.com</span>
						</div>
						<div class="invalid-feedback mb-3">
							Please provide valid email.
						</div>
					</div>
					<p class="text-muted font-italic mb-0 pb-0">Address</p>
					<div class="input-group mb-3">
						<form:input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Address"
							path="address"	/>
						<div class="invalid-feedback mb-3">
							Please provide valid address.
						</div>
					</div>
	                <p class="text-muted font-italic mb-0 pb-0">PhoneNumber</p>
					<div class="input-group mb-3">
						<form:input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Phone Number" path="phoneNumber"	required="required"  maxlength="8" pattern="[8-9][0-9]{7}"/>
							

						
							<p id="demo1"></p>

						<div class="invalid-feedback mb-3">
							
						</div>
					</div>

					<p class="text-muted font-italic mb-0 pb-0">Birthday</p>				
						
					<!--  <div class="input-group date mb-3" data-provide="datepicker">	 -->				
					<div class="input-group mb-3" >
						<form:input type="text" class="form-control" id="birthday" placeholder="Choose Start Date" path="dob"/>
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-th"></span>
						</div>
						<div class="invalid-feedback mb-3">
							Please provide birthday.
						</div>
					</div>
					
					<p class="text-muted font-italic mb-0 pb-0">Role</p>
					<div class="input-group mb-3">
						<form:select name="role" id="role" class="form-control" path="role" required="required">
							<form:options items="${roleList}"/>
	                    </form:select>
						<div class="invalid-feedback mb-3">
							Please provide a role.
						</div>
					</div>
					<a href="/team5cab/admin/welcome" class="btn btn-secondary">Cancel</a>
					<input type="submit" class="btn btn-primary" value="Add user" onclick="myphone()"/>
				</form:form>
		</div>
	</div>
                      
                       <script >
						function validateEmail(emailField){
                                   var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

                                 if (reg.test(emailField.value) == false) 
                                 {
                                      alert('Invalid Email Address');
                                     return false;
                                  }

                                    return true;
						}
                        </script>
</body>
<script><%@include file="/WEB-INF/js/birthday_datepicker.js" %></script>
</html>