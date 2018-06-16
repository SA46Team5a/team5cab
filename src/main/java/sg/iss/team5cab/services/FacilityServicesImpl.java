package sg.iss.team5cab.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.iss.team5cab.model.Facility;
import sg.iss.team5cab.model.FacilityType;
import sg.iss.team5cab.repo.FacilityRepository;
import sg.iss.team5cab.utils.CABDate;


@Service
public class FacilityServicesImpl implements FacilityServices{
	
	@Resource
	private FacilityRepository fRepo;
	
	@Autowired
	private BookingService bService;
	
	
	/* (non-Javadoc)
	 * @see sg.iss.team5cab.services.FacilityService#findFacilityById(int)
	 */

	@Transactional
	public Facility findFacilityById(int id){
		return fRepo.findOne(id);
	}
	@Override
	@Transactional
	public List<Integer> findFacilityIDByTypeName(String typeName){
		return fRepo.findFacilityIDByTypeName(typeName);
	}
	
	/* (non-Javadoc)
	 * @see sg.iss.team5cab.services.FacilityService#findIsDamagedList(boolean)
	 */

	@Transactional
	public ArrayList<Facility> findIsDamagedList(boolean isDamaged){		
		ArrayList<Facility> f= (ArrayList<Facility>)fRepo.findIsDamaged(isDamaged);		
		return f;
	}
		
	
	/* (non-Javadoc)
	 * @see sg.iss.team5cab.services.FacilityService#createFacility(sg.iss.team5cab.model.Facility)
	 */

	@Transactional
	public Facility createFacility(Facility fac)
	{
		System.out.println("facility:"+fac.toString());
		return fRepo.saveAndFlush(fac);
	}
	
	
	/* (non-Javadoc)
	 * @see sg.iss.team5cab.services.FacilityService#updateFacility(sg.iss.team5cab.model.Facility)
	 */

	@Transactional
	public Facility updateFacility(Facility fac)
	{
		return fRepo.saveAndFlush(fac);
	}
	

    @Override
	@Transactional
    public boolean deleteFacility(Facility fac)
	{
		Facility f = fRepo.findOne(fac.getFacilityID());
		
		f.setIsDeleted(true);
		if(fRepo.saveAndFlush(fac).equals(null))
		{
			return false;
		}
		else
			return true;		
		
	}
	
	
	/* (non-Javadoc)
	 * @see sg.iss.team5cab.services.FacilityService#findFacility(java.lang.String, java.util.Date, java.util.Date, boolean)
	 */

	@Transactional
	public ArrayList<Facility> findFacility(FacilityType ft, Date startDate,Date endDate,boolean isDamaged)
	{	
		ArrayList<Facility> facilityList;
		ArrayList<Facility> returnList;
		
		if (ft == null) // when no typeID is requested
			facilityList = fRepo.findIsDamaged(isDamaged);
		else
			facilityList = fRepo.findIsDamagedOfType(isDamaged,  ft);
		if (startDate == null && endDate == null) 
			return facilityList;
		else {
			System.out.println(facilityList.size());
			returnList = new ArrayList<Facility>();

			for (Facility f : facilityList) {
				if (bService.checkFacilityAvailability(f, startDate, endDate))
					returnList.add(f);
			}
			return returnList;
		}
	}



}	
