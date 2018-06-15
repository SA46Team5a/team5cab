<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cab" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html5 PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Create Booking</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<cab:headImports />
</head>

<body>
	<cab:nav /> 
    <!--End of template-->

    <h1 style="text-align: center;">Create Booking</h1>
    <hr>
    <div class="container">
        <div class="card mt-5">
            <form:form action="team5cab/admin/booking/create/" method="post" class="col-12 card-body" modelAttribute="booking">
                <div class="input-group mb-3">
                    <form:hidden path="facility.facilityID" />
                    <input type="text" class="form-control" name="facilityName" value="${booking.facility.facilityName}" disabled />
                    <form:hidden path="users.userID" />
                    <c:if test="${sessionScope.role ==\"admin\"}" >
                     	 <label class="form-check-label ml-5 pt-1">
                        <form:checkbox path="isUnderMaintenance" class="form-check-input" value=""/>For Maintenance
                    	</label>	
                    </c:if>
                 
                </div>
                <div class="form-row justify-content-center date input-daterange mb-3 form-inline" data-provide="datepicker">
                    <form:input type="text" class="form-control" id="startDate" placeholder="Choose Start Date" path="startDate"/>
                    <div class="input-group-addon col-1 text-center">to</div>
                    <form:input type="text" class="form-control" id="endDate" placeholder="Choose End Date" path="endDate" />
                </div>
                <div class="text-center">
                    <button id="submit" type="submit" class="btn btn-primary mb-3">Book</button>
                </div>
                <div class="text-center">
					<p>${message}</p>                
                </div> 
            </form:form>
        </div>
		<input hidden type="text" id="dateList" value=<c:out value="${availableDateList}" /> />
    </div>
</body>

    <script>
        var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
        var maxDate = new Date();
        maxDate.setDate(today.getDate() + 7);
        var dateList = $('#dateList').val().split(",");
        
        function padLeft(num, size) {
            var s = num+"";
            while (s.length < size) s = "0" + s;
            return s;
        }
        
        function stringToDate(str) {
        	var dateArray = new Array();
        	str.split("/").forEach(function (s) {
        		dateArray.push(parseInt(s));	
        	});
        	// Date in MM/dd/yyyy format
        	var x = new Date(
				dateArray[2],
				dateArray[0] - 1,
				dateArray[1],
				0,0,0,0
        	);
        	return x;
        }
        
        function dateToString(date) {
        	return padLeft(date.getMonth() + 1,2) + "/" + padLeft(date.getDate() ,2) + "/" + date.getFullYear();
        }
        
        function getMaxDate() {
        	var dateString = $('#startDate').val();
        	var cDate = stringToDate(dateString);
        	do  {
        		cDate.setDate(cDate.getDate() + 1);
        		dateString = dateToString(cDate);
        	} while (dateList.indexOf(dateString) == -1 && cDate.getTime() < maxDate.getTime());
        	console.log(dateString);
        	return dateString;
        }	
        
        $('#startDate').datepicker({
            uiLibrary: 'bootstrap4',
            iconsLibrary: 'fontawesome',
            minDate: today,
            maxDate: maxDate,
            disableDates:
            	dateList
        });
        
        $('#startDate').change( function () {
        	$('#endDate').val($('#startDate').val());
        });

        $('#endDate').datepicker({
            uiLibrary: 'bootstrap4',
            iconsLibrary: 'fontawesome',
            minDate: today,
 			maxDate: maxDate,
 			disableDates:
            	dateList
        });

    </script>
