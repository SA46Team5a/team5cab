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
<title>Login</title>
</head>
<body>
	<cab:nav />
    <form:form id="form1" action="./login" modelAttribute="Users">
        <div class="container">
            <div class="page-header text-center">
                <h1>CAB</h1>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <strong>Log in</strong>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="usr">Name:</label> 
                                <form:input type="text" class="form-control"
                                    id="usr" path="userID" required="required"  />
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label> 
                                <form:input type="password"
                                    class="form-control" id="pwd" path="password" required="required"  />
                            </div>
                            <div class="checkbox">                               
                                <input type="checkbox" value="">
                                <label class="form-check-label" for="exampleCheck1">Remember me next time</label>
                            </div> 
                            <div class="form-group text-center">                                                 
                                <button class="btn btn-primary" type="submit">Log in</button>
                            </div>                           
                        </div>
                    </div>
                    <p class="text-muted font-italic mb-3 pb-0">Don't have an account? Sign up now!</p>
			        <div class="form-group text-center">                                                 
                    	<button type="submit" class="btn btn-primary mb-3 text-center">Register</button>
                    </div>
                </div>
            </div>
        </div>
    </form:form>
</body>
</html>