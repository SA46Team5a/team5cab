<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cab"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html5 PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Search Booking</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<cab:headImports />

</head>

<body>
	<cab:nav />

	<!--End of template-->

	<h1 style="text-align: center;">Search Booking</h1>
    <hr>
    <div class="container">

        <card class="card mt-5">
            <form:form action="/team5cab/${sessionScope.role}/booking/search" method="post" class="col-12 card-body needs-validation" modelAttribute="booking">
				<div class="form-group">
			<c:if test="${sessionScope.role == 'admin'}"	>
                    <form:input type="text" class="form-control"  placeholder="User ID" required="required" path="users.userID" />
              </c:if> 
                </div>  
                <div class="form-group">
                    <form:select path= "facility.facilityType.typeName" id="facility-type" class="form-control">
                        <option value="" required="required" selected disabled>Select your facility Type</option>
                        <form:options items="${listOfTypeName}" />
                    </form:select>
                </div>
			    <div class="form-group">
                    <div class="invalid-feedback">
                        Please select Facility Type
                    </div>
                </div>
                <div class="input-group mb-3 date input-daterange" data-provide="datepicker">
                    <form:input path="startDate" type="text" class="form-control" placeholder="Choose Start Date" />
                    <div class="input-group-addon" required="required">to</div>
                    <form:input path="endDate" type="text" class="form-control" placeholder="Choose Start Date" required="required"/>

                    <div id="validation-text" class="mb-3">
                    </div>
                </div>
                <div class="input-group mb-3" hidden>
                    <input type="text" class="form-control" aria-label="Username" aria-describedby="InputGroup-sizing-default" placeholder="Username"
                    />
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary" onclick="">Search</button>
                </div>
            </form:form>
        </div>

        <table id="search-booking-table" class="table table-hover">
            <thead>
                <tr>
                    
                    <th>Facility Name</th>
                    <th>Booking Start</th>
                    <th>Booking End</th>
                    <th>Username</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${bookings}">
                <tr>
                      <td class="align-middle">${item.facility.facilityType.typeName }</td>
                    <td class="align-middle"><fmt:formatDate pattern="dd/MM/yyyy" value="${item.startDate}"/> </td>
                    <td class="align-middle"><fmt:formatDate pattern="dd/MM/yyyy" value="${item.endDate}"/></td>
                    <td class="align-middle">${item.users.userID}</td>
                    <td class="align-middle">
                        <a href="<c:url value="/admin/booking/edit/${item.bookingID}" />" class="btn btn-secondary">Edit</a>
                    	<a href="<c:url value="/admin/booking/delete/${item.bookingID}" />" class="btn btn-danger">Cancel</a>
                    </td>
                </tr>
                </c:forEach>
                
                </tbody>
        </table>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="deleteModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Confirm Delete</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Booking deleted</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

    <nav class="mt-5">
        
    </nav>
</body>