<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cab" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html5 PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Edit Booking</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<cab:headImports />

<body>
	<cab:nav /> 
    <!--End of template-->

    <h1 style="text-align: center;">Edit Booking</h1>
    <hr>
    <div class="container">
        <div class="card mt-5">
			<c:if test="${param.bookingWarning==\"true\"}">
            	<div class="alert alert-danger" role="alert">
					 Sorry! The dates you selected are already booked. Please try for other dates!
				</div>
            </c:if>
            <form:form action="team5cab/admin/booking/edit" method="post" modelAttribute="booking" class="col-12 card-body">
                <div class="input-group mb-3">
                	
                    <input value="${booking.facility.facilityName}" type="text" class="form-control" aria-label="Facility Name" aria-describedby="InputGroup-sizing-default" 
                        disabled/>
                        <form:hidden path="bookingID" />
					<input type="text" class="form-control" aria-label="Facility Name" aria-describedby="InputGroup-sizing-default" 
                        disabled value="BookingID:${booking.bookingID}" />
                </div>
                <div class="form-row justify-content-center date input-daterange mb-3 form-inline" data-provide="datepicker">
                    <form:input type="text" class="form-control" id="startDate" placeholder="Choose Start Date" path="startDate"/>
                    <div class="input-group-addon col-1 text-center">to</div>
                    <form:input type="text" class="form-control" id="endDate" placeholder="Choose End Date" path="endDate" />
                </div>
                <div class="text-center">
                    <input type="submit" class="btn btn-primary mb-3" value="Update">
                </div>

            </form:form>
        </div>
		<input hidden type="text" id="dateList" value="${availableDateList}" />
    </div>
</body>
<script><%@include file="/WEB-INF/js/booking_datepicker.js" %></script>
