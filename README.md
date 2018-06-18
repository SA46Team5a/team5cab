# Club Application for Booking
## System Design Overview
### Frontend
- Views
	- View rendering using JSP
	- Styling using Bootstrap 4
	- Datepickers in various pages using [gijgo datepicker](http://gijgo.com/datepicker/example/bootstrap-4 )
	- Custom tags used for determining which navigation bar and welcome page to render
	- Frontend validation using Javascript

### Backend
- Using Spring MVC
- Routing and Business Logic
	- Controllers
	- Services
- Data Layer
	- Data Access Layer
			- Using JPA Repository
	- Models
		- Using JPA
- Database
	- Using MySQL

## Package Structure
### Frontend resources
- src.main.webapp.WEB-INF.js
	- js files for setting up of datepickers
- src.main.webapp.WEB-INF.tags
	- tags for setting up styles and script headers, navigation bar and welcome page rendering
- src.main.webapp.WEB-INF.views
	- collection of all views used in CAB web app

### Backend resources
- src.main.java.controllers
	- Contains the routing and some validation logic. Interacts mainly with views and services.
- src.main.java.filters
	- Contains authentication filter intended for handling access control. Not able to implement as we ran into server-side errors when attempting to instantiate it in the initializer.
- src.main.java.init
	- Contains the web app configuration files
- src.main.java.model
- src.main.java.repo
	- Contains the data access layer codes for interacting with the database
- src.main.java.services
	- Contains the business logic of the application, and interacts with the repositories.
- src.main.java.utils
	- Contains a date utility class for handling date-related operations
- SQL
	- Contains the SQL script for setting up the database

## Setup
### Database setup
- Run the SQL script named *sa46team5.sql* in the SQL folder.
- Ensure that the *#DB Properties* in the application.properties matches your MySQL configuration before starting the server

### Server setup
- No additional steps required for running the server.

### Login Information
- Trial Member Account:
	- UserID: Abraham1234
	- Password: rQnYRz3L
- Trial Admin Account:
	- UserID: Antoinette1234
	- Password: jGxqBeBX

## Known Bugs

## Closing thoughts
In addition to fulfilling the requirements set out by the project, we wanted to achieve the following:
- To allow each team member to identify and explore the areas of development they are interested in.
- To focus on mastering the basic concepts.

To meet the above, we designed the system such that it just meets the key requirements of the project without additional functions, so that every member can have more time mastering the basics in their assigned components.


