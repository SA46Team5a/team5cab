package sg.iss.team5cab.repo;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sg.iss.team5cab.model.Booking;
import sg.iss.team5cab.model.Facility;

public interface BookingRepository extends JpaRepository<Booking, Integer> {
	@Query("SELECT b FROM Booking b WHERE b.endDate <=:endDate AND"
			+ " b.startDate>=:startDate AND b.facility.facilityID=:fID AND b.users.userID=:uID AND b.isCancel=false")
	List<Booking> findBookingDates(@Param("startDate") Date startDate, @Param("endDate") Date endDate,
			@Param("fID") int fID,@Param("uID") String uID);
	
	
	@Query("SELECT b FROM Booking b WHERE b.endDate <=:endDate AND"
			+ " b.startDate>=:startDate AND b.facility.facilityID=:fID AND b.isCancel=false")
	List<Booking> findBookingDatesForMember(@Param("startDate") Date startDate, @Param("endDate") Date endDate,
			@Param("fID") int fID);
	
	
//	@Query("SELECT u FROM User u WHERE u.name=:un AND u.password=:pwd")
//	User findUserByNamePwd(@Param("un") String uname, @Param("pwd") String pwd);
	
	@Query("Select b from Booking b where b.facility.facilityID=:id")
	List<Booking> findBookingsByFacilityID(@Param("id") int fid);
	
	@Query("Select b from Booking b "
			+ "where not "
			+ "(b.startDate > startDate and "
			+ "b.endDate < endDate) "
			+ "order by b.startDate")
	ArrayList<Booking> findBookingsBetweenStartAndEndDateInclusive(
			@Param("startDate") Date startDate,
			@Param("endDate") Date endDate
			);

	@Query("Select b from Booking b "
			+ "where not "
			+ "(b.startDate > :startDate and "
			+ "b.endDate < :endDate) "
			+ "and b.facility = :facility "
			+ "order by b.startDate")
	ArrayList<Booking> findBookingsBetweenStartAndEndDateInclusiveByFacility(
			@Param("startDate") Date startDate,
			@Param("endDate") Date endDate,
			@Param("facility") Facility facility
			);
	
	
	
}
