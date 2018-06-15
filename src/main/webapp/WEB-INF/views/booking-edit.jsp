<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cab" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html5 PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Edit Booking</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<cab:headImports />
</head>

<body>
	<cab:nav /> 
    <!--End of template-->

    <h1 style="text-align: center;">Edit Booking</h1>
    <hr>
    <div class="container">
        <div class="card mt-5">
            <form:form action="team5cab/admin/booking/edit" method="post" modelAttribute="booking" class="col-12 card-body">
                <div class="input-group mb-3">
                	
                    <input value="${booking.facility.facilityName}" type="text" class="form-control" aria-label="Facility Name" aria-describedby="InputGroup-sizing-default" 
                        disabled/>
                        <form:hidden path="bookingID" />
					<input path="bookingID" type="text" class="form-control" aria-label="Facility Name" aria-describedby="InputGroup-sizing-default" 
                        disabled value="BookingID:${booking.bookingID}" />
                </div>
                <div class="input-group date input-daterange mb-3" data-provide="datepicker">
                    <form:input path="startDate" type="text" class="form-control" id="booking-start" placeholder="Choose Start Date"/>
                    <div class="input-group-addon">to</div>
                    <form:input path="endDate" type="text" class="form-control" id="booking-end" placeholder="Choose End Date"/>
                </div>
                <div class="text-center">
                    <input type="submit" class="btn btn-primary mb-3" value="OK">
                </div>
            </form:form>
        </div>

    </div>

</body>
