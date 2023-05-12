package study11;

import java.util.Date;

public class DateFormat1 {
	
	public static void main(String[] args) {
	
		/*
		 * Calendar cal = Calendar.getInstance();

		String format = "yyyy/MM/dd";
		SimpleDateFormat df = new SimpleDateFormat(format);
		System.out.println("현재날짜 : " +df.format(cal.getTimeInMillis()));
		*
		*/
		Date today = new Date();
		System.out.println(today);
	}
}
