package sg.iss.team5cab.utils;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;

public class CABDate {
	public static Date getToday() {
		Calendar today = Calendar.getInstance();
		today.set(Calendar.HOUR, 0); 
		today.set(Calendar.MINUTE, 0); 
		today.set(Calendar.SECOND, 0);
		today.set(Calendar.MILLISECOND, 0);
		return today.getTime();
	}
	
	public static LocalDateTime getLocalDateTime(Date date) {
		Instant i = date.toInstant();
		return LocalDateTime.ofInstant(i,ZoneId.systemDefault());

	}
	
	public static Date plusDays(Date date, int numberOfDays) {
		return Date.from((getLocalDateTime(date).plusDays(numberOfDays)).toInstant(OffsetDateTime.now().getOffset()));
	}
}
