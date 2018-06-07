<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

</head>
<body>
    <div>
     <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="justify-content-end collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="facilityDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Facility
                    </a>
                    <div class="dropdown-menu" aria-labelledby="facilityDropdown">
                        <a class="dropdown-item" href="#">Add Facility</a>
                        <a class="dropdown-item" href="#">Search Facility</a>
                        <a class="dropdown-item" href="#">Update Facility</a>
                        <a class="dropdown-item" href="#">Delete Facility</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="bookingDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Booking
                    </a>
                    <div class="dropdown-menu" aria-labelledby="bookingDropdown">
                        <a class="dropdown-item" href="#">Add Booking</a>
                        <a class="dropdown-item" href="#">Search Booking</a>
                        <a class="dropdown-item" href="#">Update Booking</a>
                        <a class="dropdown-item" href="#">Delete Booking</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="usersDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Users
                    </a>
                    <div class="dropdown-menu" aria-labelledby="usersDropdown">
                        <a class="dropdown-item" href="#">Add User</a>
                        <a class="dropdown-item" href="#">Search User</a>
                        <a class="dropdown-item" href="#">Update User</a>
                        <a class="dropdown-item" href="#">Delete User</a>
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="">Register</a></li>
            </ul>
        </div>
    </nav>
   </div>
  
      <form id="form1" runat="server">
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
                               <label for="validationDefault04">Name</label>
                               <input type="text" class="form-control" id="validationDefault04" placeholder="Name" required>
                               
                            </div>
                            <div class="form-group">
                                <label for="validationDefault05">Password</label>
                                <input type="text" class="form-control" id="validationDefault05" placeholder="Password" required>
                            </div>
                            <div class="checkbox">                               
                                    <input type="checkbox" value="">
                                    <label class="form-check-label" for="exampleCheck1">Remember me next time</label>
                            </div>                          
                                <button type="button" id="button_signup" class="btn">Sign up</button>                         
                                <button class="btn btn-primary" type="submit">Log in</button>                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    
</body>
</html>