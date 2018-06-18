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

## User Guide
### Homepage
- /team5cab/welcome

### User access rights
- Public: 
	- Can search for facilities (will be redirected to login when "Book" is clicked when browsing facilities)
	- Can register as new user
- Member: 
	- Can search for facilities
	- Can book facilities 
	- Can search for bookings tied to own account
- Admin:  
	- Can edit facility details and delete facility
	- Can book facilities for maintenance
	- Can search bookings by the username or UserID
	- Can edit bookings after today
	- Can edit User details
	- Can add a new User (Admin/Member)
		
### Login information
- Trial Member Account:
	- UserID: Abraham1234
	- Password: rQnYRz3L
- Trial Admin Account:
	- UserID: Antoinette1234
	- Password: jGxqBeBX
	
### Sample Screen Flow
- Test scenario:
	- Our Club Booking Application start with Welcome Page.
	- User can search available facilities at this page without login. 
	- When user click book, he will be redirected to the login page.
	- After user login, the menu option for Booking will be enabled.
	- User can select "make Booking" and he will be redirected to "Search Facility" page.
	- In this page, user can search by facilityType, startDate and endDate, separately or combined search. 
	- The search results of available facilities will be displayed in same page, the user can make a booking by clicking Book button. 
	- After click the Book button, User will be redirected to "create booking" page.
	- In this page, User need to choose the start and end dates( clash booking will lead to a error message).
	- Available start dates and end dates are enabled from today till a week later(except those days already been booked)
	- After selecting start and end date, User clicks Book button to confirm the booking. User will be redirected to the booking confirmation page. 
	- User can choose to continue make the booking by click "Back to Create Booking" button or go back to home page by click "Home" button.

###Features in each Page

-"Welcome page" 
	- 1.menu option for users will only be enable at admin login
	- 2.menu option for Booking only be enable at member login and admin login.

-"Search facility"
	- 1.admin can book for maintenance, edit and delete facility in this page.

-"Search booking"
	- 1.for member login, the "userID input" will be disabled
	- 2.for admin login, the "userID input" will be enabled thus admin can search booking records by userID and start end dates.
	- 3.they can edit and cancel the booking record
	- 4.the booking record before today will be displayed as Expired

- "Add user"
	- 1.all the field can not be null
	- 2.email address must follow the email format
	- 3.phone number must be start with 8 or 9 and must be 8 digits
	- 4.birthday must be before today

## Known Bugs

## GitHub
- [gijgo Github team5cabRepository]https://github.com/SA46Team5a/team5cab

## Closing thoughts
In addition to fulfilling the requirements set out by the project, we wanted to achieve the following:
- To allow each team member to identify and explore the areas of development they are interested in.
- To focus on mastering the basic concepts.

To meet the above, we designed the system such that it just meets the key requirements of the project without additional functions, so that every member can have more time mastering the basics in their assigned components.

try for Test Driven Development for the next project.



