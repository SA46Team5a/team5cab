package sg.iss.team5cab.contollers;

import java.awt.Component;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import sg.iss.team5cab.model.Users;
import sg.iss.team5cab.services.UsersService;

@Controller
public class SessionController {
	
	@Autowired
	UsersService usersService;

	@RequestMapping(value="public/login", method=RequestMethod.GET)
	public ModelAndView loadLogin(HttpSession session) {
		return new ModelAndView("user_login", "Users", new Users());
	}
	
	@RequestMapping(value="public/login", method=RequestMethod.POST)
	public ModelAndView processLogin(@ModelAttribute("Users") Users user, HttpSession session) {
		Users authUser = usersService.authenticate(user.getUserID(), user.getPassword());
		if (authUser != null) {
			session.setAttribute("role", authUser.getRole().toLowerCase());
			session.setAttribute("userID", authUser.getUserID());
			return new ModelAndView("redirect:/welcome");
		}
		else {
			session.setAttribute("login", "false");
			return new ModelAndView("user_login", "Users", new Users());
		}
	}
	
	@RequestMapping(value="public/logout", method=RequestMethod.GET)
	public ModelAndView loadLogout(HttpSession session) {
		session.setAttribute("role",  null);
		return new ModelAndView("user_logout");
	}
	
	@RequestMapping(value="public/forgetpassword", method=RequestMethod.GET)
	public ModelAndView loadInputUserid(HttpSession session) {
		return new ModelAndView("user-inputid","Users", new Users());
	}
	
	@RequestMapping(value="public/forgetpassword", method=RequestMethod.POST)
	public ModelAndView checkInputUserid(@ModelAttribute("Users") Users user, HttpSession session) {
		Users u = usersService.findUserByUID(user.getUserID());
		if( u != null)
		{
			u.setPassword("");
			return new ModelAndView("user_forget_password","Users", u);
		}
		else 
		{
			return new ModelAndView("404page");
		}
		
	}
	
	@RequestMapping(value="public/changepassword", method=RequestMethod.POST)
	public ModelAndView changePassword(@ModelAttribute("Users") Users user) {
		usersService.changeUser(user);
		Component frame=null;
		JOptionPane.showMessageDialog(frame, "password has been changed");
		return new ModelAndView("user_login", "Users", new Users());
	}
	
	@RequestMapping(value="/invalidpage", method=RequestMethod.GET)
	public ModelAndView InvalidPageAccess(HttpSession session) {
		session.setAttribute("role",  null);

		
		return new ModelAndView("user_login","Users", new Users());

	}
	
}
