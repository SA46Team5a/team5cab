package sg.iss.team5cab.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sg.iss.team5cab.model.Users;
import sg.iss.team5cab.services.UsersService;
@Controller
public class RegistrationController {
	@Autowired
    UsersService usersService;
	
	@RequestMapping(value="public/register", method = RequestMethod.GET)
	public ModelAndView displayRegistration(HttpSession session) {
		return new ModelAndView("user_registration", "Users", new Users());
	}
	
	@RequestMapping(value="public/register", method = RequestMethod.POST)
	public ModelAndView processRegistration(@ModelAttribute("Users") Users user, HttpSession session) 
	{
		
		System.out.println(user.getAddress());
		Users authUser = usersService.findUserByUID(user.getUserID());
		if(authUser!=null) 
		{
			user.setPassword("");
			user.setUserID("");
			return new ModelAndView("user_registration", "Users", user);
		}
		else 
		{
			user.setRole("Member");
			usersService.CreateUser(user);
			user.setPassword("");
			ModelAndView mav = new ModelAndView("user_login", "Users", user);
			return mav;
		}
	}
}