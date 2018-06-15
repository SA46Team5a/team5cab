package sg.iss.team5cab.services;


import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.iss.team5cab.model.Booking;
import sg.iss.team5cab.model.Facility;
import sg.iss.team5cab.repo.BookingRepository;
import sg.iss.team5cab.repo.FacilityRepository;
import utils.CABDate;

@Service
public class BookingServicesImpl implements BookingService {

	@Resource
	FacilityRepository fRepo;
	
	@Resource
	BookingRepository bRepo;
	//Screen Booking-create-update
	/* (non-Javadoc)
	 * @see sg.iss.team5cab.services.BookingService#createBooking(sg.iss.team5cab.model.Booking)
	 */
	@Transactional
	@Override
	public Booking createBooking(Booking booking)
	{
		 return bRepo.saveAndFlush(booking);
	}
	
	//Screen Booking-create-update
	/* (non-Javadoc)
	 * @see sg.iss.team5cab.services.BookingService#updateBooking(sg.iss.team5cab.model.Booking)
	 */
	@Transactional
	@Override
	public Booking updateBooking(Booking booking)
	{
		 return bRepo.saveAndFlush(booking);
		 
	}
	
	/* (non-Javadoc)
	 * @see sg.iss.team5cab.services.BookingService#findBookingByAdmin(int, java.time.LocalDate, java.time.LocalDate, java.lang.String)
	 */
	@Transactional 
	@Override
	public List<Booking> findBookingByAdmin(int fID,Date start,Date end,String uID)
	{
		
		 return bRepo.findBookingDates(start, end, fID, uID);
	}
	/* (non-Javadoc)
	 * @see sg.iss.team5cab.services.BookingService#findBookingByMember(int, java.time.LocalDate, java.time.LocalDate)
	 */


	
	/* (non-Javadoc)
	 * @see sg.iss.team5cab.services.BookingService#deleteBooking(int, java.time.LocalDate, java.time.LocalDate, java.lang.String)
	 */
	
	@Transactional
	@Override
	public Booking deleteBooking(int bookingID)
	{

		Booking book=bRepo.findOne(bookingID);
		book.setIsCancel(true);
		return bRepo.saveAndFlush(book);

	}

	@Transactional
	@Override
	public boolean checkFacilityAvailability(Facility f, Date start, Date end) {
		ArrayList<Booking> bookings;
		
		// Availability should only be checked between today and X days from today.
		Date today = CABDate.getToday();
		System.out.println(today);
		Date checkEndDate = CABDate.plusDays(today, 7);
		start = start.before(today) ? today : start;
		end = end.after(checkEndDate) ? checkEndDate : end;

		// get all bookings between start and end date, including those at include the start and end date

		bookings = bRepo.findBookingsBetweenStartAndEndDateInclusiveByFacility(start, end, f);
		
		if (bookings.size() == 0)
			return true;
		
		ArrayList<Date> dates = BookingDatesToDateList(bookings);
		
		long days = ChronoUnit.DAYS.between(CABDate.getLocalDateTime(start), CABDate.getLocalDateTime(end)) + 1;
		return (long) dates.size() < days; 
	}
	
	@Transactional
	@Override
	public boolean checkFacilityAvailability(int fID,Date start,Date end)
	{
		//if there is no fID in booking record,then available
		boolean result=false;
		List<Booking> bookingList=bRepo.findBookingsByFacilityID(fID);
		if(bookingList==null)
		{
			result= true;
		}
		else//if fID is inside booking record then check if start and end day frame
			//is within each test record
		{
			Calendar c = Calendar.getInstance();
			List<Date> bookedDates=new ArrayList<Date>();
			for (Date date = start; date.equals(end); CABDate.plusDays(date, 1))  {
				bookedDates.add(date);
			}
			//save each day from start to end to a list. then traverse through each booking duration.
			//delete all matching booking record from the created list.if at end of day,the list is empty then not available
			for(Booking b:bookingList)
			{
				if((b.getStartDate().before(start)||b.getStartDate().equals(start))&&(b.getEndDate().equals(end)||b.getEndDate().after(end)))
				{result= false;}
				else
				{
					for(Date date=b.getStartDate();date.equals(end);CABDate.plusDays(date, 1))
					{
						bookedDates.remove(date);
					}
				}
			}
			if(bookedDates.isEmpty())
				result=false;
		}
		return result;
	}
	
	
	//@Transactional DAO methods that uses JPARepo
	/* (non-Javadoc)
	 * @see sg.iss.team5cab.services.BookingService#displayAll()
	 */
	@Transactional
	@Override
	public List<Booking> displayAll()
	{
		 return (List<Booking>)bRepo.findAll();
	}
	

	
	
	
	/* (non-Javadoc)
	 * @see sg.iss.team5cab.services.BookingService#findAvailableDates(int)
	 */
	@Override
	@Transactional
	public ArrayList<Date> findUnavailableDates(int fid){
		Facility f = fRepo.findOne(fid);
		Date today= CABDate.getToday();
		Date end = CABDate.plusDays(today, 7);
		ArrayList<Booking> bookings = bRepo.findBookingsBetweenStartAndEndDateInclusiveByFacility(today, end, f);
		return BookingDatesToDateList(bookings);
	}	
	
	/* (non-Javadoc)
	 * @see sg.iss.team5cab.services.BookingService#isBookingClash(int, java.time.LocalDate, java.time.LocalDate)
	 */
	@Override
	@Transactional
	public boolean isBookingClash(int fid, Date startDate, Date endDate) {

		Facility searchFacility = fRepo.findOne(fid);
		ArrayList<Booking> existingBookingBetweenStartAndEnd = 
				bRepo.findBookingsBetweenStartAndEndDateInclusiveByFacility(startDate, endDate, searchFacility);
		
		
		return existingBookingBetweenStartAndEnd.size()==0 ? false : true;
			
//		ArrayList<Booking> listOfBookingsByFid = (ArrayList<Booking>)bRepo.findBookingsByFacilityID(fid); 
//		for (Date date = startDate; date.before(endDate); date = CABDate.plusDays(date, 1)) {
//			for (Booking b : listOfBookingsByFid) {
//				if(date.before(b.getEndDate()) && date.after(b.getStartDate())){
//					return true;
//				}
//			}
//		}
//		return false;
	}

	@Override
	@Transactional
	public List<Integer> findAllFacilityID()
	{
		return bRepo.findAllFacilityID();
	}
	@Override
	@Transactional
	public Booking findBookingByID(int ID)
	{
		return bRepo.findOne(ID);
	}
	@Override
	@Transactional
	public List<Booking> findAllBooking()
	{
		return bRepo.findAll();
	}
	@Override
	@Transactional
	public List<Booking> findBookingByTypeName(String typeName,Date start,Date end,String uID)
	{
		return bRepo.findBookingByTypeName(start, end, typeName, uID);
	}
	
	public ArrayList<Date> BookingDatesToDateList(List<Booking> bookings) {
		ArrayList<Date> dates = new ArrayList<Date>();
		for (Booking b : bookings) {
			Date date = b.getStartDate();
			do {
				dates.add(date);
				date = CABDate.plusDays(date,  1);
			} 
			while(!date.after(b.getEndDate()));
		}
		return dates;
	}
}
