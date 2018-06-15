package sg.iss.team5cab.contollers;

import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sg.iss.team5cab.model.Booking;
import sg.iss.team5cab.model.Facility;
import sg.iss.team5cab.model.FacilityType;
import sg.iss.team5cab.services.FacilityServices;
import sg.iss.team5cab.services.FacilityTypeService;

@Controller
public class FacilityController {

	@Autowired
	private FacilityServices fService;


	@Autowired
	private FacilityTypeService ftService;	
 		
	@RequestMapping(value = "/admin/facility/create", method = RequestMethod.GET)
	public ModelAndView createFacilityPage() {
		ModelAndView mav = new ModelAndView("facility_create_update");		
		mav.addObject("Facility", new Facility());
		mav.addObject("listOfFacilityType",ftService.findAllTypeByID());
		mav.setViewName("facility_create_update");
		return mav;

	}
	
	@RequestMapping(value="/admin/facility/create", method =RequestMethod.POST)
	public ModelAndView createNewFacility(@ModelAttribute("Facility") Facility facility, 
			final RedirectAttributes redirectAttributes)
	{
		ModelAndView mav=new ModelAndView();	
		fService.createFacility(facility);		
		mav.setViewName("redirect:/admin/facility/create/confirmation");	
	    redirectAttributes.addFlashAttribute("facility", facility);
	    return mav;
	}
	
	@RequestMapping(value = "/admin/facility/create/confirmation", method = RequestMethod.GET)
	public ModelAndView createFacilityConfirmationPage(@ModelAttribute("Facility") Facility facility) {
		ModelAndView mav = new ModelAndView("facility-confirmation");
		mav.addObject("Facility", facility);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/admin/facility/update/{fid}", method = RequestMethod.GET)
	public ModelAndView updateFacilityPage(@PathVariable int fid ) {
		
		Facility facility = fService.findFacilityById(fid);		
		ModelAndView mav = new ModelAndView("facility_edit","Facility",facility);		
		return mav;
	
	}
	
	@RequestMapping(value="/admin/facility/update", method=RequestMethod.POST)
	public ModelAndView updatenewFacility(@ModelAttribute("Facility") Facility facility, 
			final RedirectAttributes redirectAttributes)
	{
		ModelAndView mav=new ModelAndView();	
		fService.updateFacility(facility);		
		mav.setViewName("redirect:/facility/update/confirmation");	
	    redirectAttributes.addFlashAttribute("facility", facility);
	    return mav;
	}
	          

	
	@RequestMapping(value = "/facility/update/confirmation", method = RequestMethod.GET)
	public ModelAndView updateFacility(@ModelAttribute("Facility") Facility facility) {		
		ModelAndView mav = new ModelAndView("facility-updateconfirmation","Facility", facility);		
		return mav;
	}	
	

	@RequestMapping(value = {"/admin/facility/search", "/member/facility/search","public/facility/search"}, method = RequestMethod.GET)
	public ModelAndView displayFacilitySearch() {

		ModelAndView mav = new ModelAndView("facility_search");

		mav.addObject("Booking", new Booking());
		mav.addObject("listOfFacilityType",ftService.findAll());
		FacilityType ft = null;
		mav.addObject("Facility", fService.findFacility(ft,  null, null, false));

		return mav;
	}
     
    @RequestMapping(value = {"/admin/facility/search", "/member/facility/search","/facility/search"}, method = RequestMethod.POST)
	public ModelAndView FacilitySearchPage(@ModelAttribute("Booking") Booking book, BindingResult result,
			final RedirectAttributes redirectAttributes)
    		throws Exception{

		ModelAndView mav = new ModelAndView();
		
		Facility f = book.getFacility();
		FacilityType ft = f.getFacilityType().getTypeID().equals("") ? null :f.getFacilityType();
		System.out.println(book.getFacility().getFacilityType());

		Date sDate=book.getStartDate();
		Date eDate=book.getEndDate();
		boolean isDmged = book.getFacility().getIsDamaged();

		mav.setViewName("facility_search");
		mav.addObject("Facility", fService.findFacility(ft, sDate, eDate, isDmged));
		mav.addObject("listOfFacilityType",ftService.findAll());
		
		return mav;
	}

    @RequestMapping(value = "/admin/facility/delete/{fid}", method = RequestMethod.GET)
	public ModelAndView deleteFacilty(@PathVariable int fid) {
		ModelAndView mav = new ModelAndView();
		
		Facility facility = fService.findFacilityById(fid);
		facility.setIsDeleted(true);
		fService.updateFacility(facility);
		mav.setViewName("redirect:/admin/facility/search");
		return mav;
		
	}
}
