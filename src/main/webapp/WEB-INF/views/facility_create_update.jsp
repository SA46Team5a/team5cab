<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cab"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html5 PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<cab:headImports />
	<title>Create Facility</title>
</head>
<body>
	<cab:nav />
	<h1 style="text-align: center;">Create Facility</h1>
	<hr>
	<div class="container">

		<card class="card mt-5">
		 <form:form	action="team5cab/admin/facility/create" class="col-12 card-body needs-validate" modelAttribute="Facility">
		 
		<!-- 	<form action="" method="post" class="col-12 card-body needs-validation" > -->
				<div class="row">
					<div class="col-4">
						<img src="https://images.pexels.com/photos/20787/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=350" id="facilityImg" class="rounded img-fluid mb-3"
							alt="Facility Image"
							 >
						<div class="text-center">
							<button type="button" class="btn" onclick="chooseImg()">Change Image</button>
						</div>

					<form:input path="" type="file" id="my_file" hidden="hidden"/>
					</div>
					<div class="col-8">
						
						<div class="input-group mb-3">
							<form:select path="facilityType.typeID" required="required" id="facility-type" class="form-control">
							<option value="" selected disabled>Select Your facility Type</option>
							<form:options items="${listOfFacilityType}" />
							</form:select>
							
						</div>
						<div class="input-group mb-3">
							<form:input type="text" path="facilityName" class="form-control" aria-label="facility-name" aria-describedby="InputGroup-sizing-default" placeholder="Facility Name"
							required="required"/>
						</div>
						
						<div class="input-group mb-3">
							<form:input type="text" class="form-control" path="address" 
							aria-label="facility-address" aria-describedby="InputGroup-sizing-default" 
							placeholder="Facility Address" required="required"
							/>
						</div>
						<div class="input-group mb-3">
							<form:textarea class="form-control" path="Description" 
							rows="3" cols="50" aria-label="facility-description" 
							aria-describedby="InputGroup-sizing-default" required="required" placeholder="Facility Desription"/>
						</div>

						<div class="input-group mb-3">
							<form:textarea class="form-control" required="required" path="damageReason" rows="3" aria-label="Damage Reason" aria-describedby="InputGroup-sizing-default"  placeholder="Damage Report"/>
						</div>

						<div class="form-check mb-3">
							<label class="form-check-label">
							<form:checkbox class="form-check-input" path="isDamaged" id="facility-unusable"/> Facility is unusable
							</label>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary mb-3">Update</button>
						</div>
					</div>
					</row>
			</form:form>
		</card>

	</div>
</body>
<script>
        function chooseImg() {
            $('#my_file').trigger("click");
        }
    </script>
</html>