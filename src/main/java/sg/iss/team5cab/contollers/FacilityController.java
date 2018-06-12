package sg.iss.team5cab.contollers;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sg.iss.team5cab.model.Facility;
import sg.iss.team5cab.model.Users;
import sg.iss.team5cab.services.FacilityServices;

@Controller
@RequestMapping(value = "/facility")
public class FacilityController {

	@Autowired
	private FacilityServices fService;

	private ArrayList<String> getTypeNames() {
		ArrayList<String> typeNames = new ArrayList<String>();

		for (Facility facility : fService.findFacility(null, null, null, false)) {
			typeNames.add(facility.getFacilityType().getTypeName());
		}
		
		return typeNames;
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView newFacilityPage(@ModelAttribute("Facility") Facility fac) {

		ModelAndView mav = new ModelAndView("facility_search");

		mav.addObject("Facility", fService.findFacility(null, null, null, false));
		mav.addObject("typeNames", getTypeNames());

		return mav;

	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView FacilitySearchPage(@ModelAttribute("Facility") Facility fac,
			BindingResult result,
			final RedirectAttributes redirectAttributes, @RequestParam("typeName") String typeName,
			@RequestParam(value="startDate",required=false) Date startDate, 
			@RequestParam(value="endDate",required=false) Date endDate,
			@RequestParam(value="isDamaged",required=false) boolean isDamaged) {


		ModelAndView mav = new ModelAndView();
		String typeId ="";
		switch(typeName) {
			
			case "Meeting Room": typeId ="MR";break;
			case "Table Tennis": typeId ="TT";break;
			case "Swimming Pool": typeId ="SP";break;
			case "Basket Ball": typeId ="BB";break;
			case "Badminton": typeId ="BT";break;
			case "Football": typeId ="FB";break;
			case "Board games": typeId ="BG";break;
			default:;
		
		}
		mav.setViewName("facility_search");
		System.out.println("Executing methodssssss");
		System.out.println(typeId);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(isDamaged);
		mav.addObject("Facility", fService.findFacility(typeId, startDate, endDate, isDamaged));
		
		mav.addObject("typeNames", getTypeNames());

		return mav;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createNewFacility(@ModelAttribute @Valid Facility facility, BindingResult result,
			final RedirectAttributes redirectAttributes) {
		if (result.hasErrors())
			return new ModelAndView("facility_create_update");
		
		ModelAndView mav = new ModelAndView();
		// String message="New Facility" + facility.getFacilityName() + "was sucessfully
		// created";

		fService.createFacility(facility);
		mav.setViewName("redirect:/facility-confirmation");
		redirectAttributes.addFlashAttribute("facility", facility);
		return mav;

	}

	@RequestMapping(value = "/update/{fid}", method = RequestMethod.GET)
	public ModelAndView updateFacilityPage(@PathVariable int fid, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("facility_create_update");
		Facility facility = fService.findFacilityById(fid);
		mav.addObject("facility", facility);

		return mav;

	}

	@RequestMapping(value = "/update/confirmation", method = RequestMethod.POST)
	public ModelAndView updateFacility(@ModelAttribute @Valid Facility facility, BindingResult result,
			@PathVariable int fid, final RedirectAttributes redirectAttributes) {

		if (result.hasErrors())
			return new ModelAndView("facility-create-update");

		ModelAndView mav = new ModelAndView();
		// String message="Department was sucessfully updated";

		fService.updateFacility(facility);
		mav.setViewName("redirect:/facility-confirmation");
		redirectAttributes.addFlashAttribute("facility", facility);
		return mav;

	}

	@RequestMapping(value = "/facility/delete", method = RequestMethod.GET)
	public boolean deleteFacilty(@PathVariable int fid) {
		ModelAndView mav = new ModelAndView();
		Facility facility = fService.findFacilityById(fid);
		return fService.deleteFacility(facility);

	}

}