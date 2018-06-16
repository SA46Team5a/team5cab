package sg.iss.team5cab.controllers;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sg.iss.team5cab.services.BookingService;
import sg.iss.team5cab.services.BookingServicesImpl;

@Controller
public class FrontController {
	

	@RequestMapping(value= {"/", "/welcome"}, method=RequestMethod.GET)
	public ModelAndView welcomeAnon(HttpSession session) {
		return new ModelAndView("welcome");
	}
}
