package study10;

import java.util.Calendar;

public class UnixTimeTest1 {
	public static void main(String[] args) {
		Calendar cal =Calendar.getInstance();
		long unix = cal.getTimeInMillis();
		System.out.println(unix);
		
		long unix2 = 183772838088L;
		cal.setTimeInMillis(unix2);
		
		int yy =cal.get(Calendar.YEAR);
		int mm =cal.get(Calendar.MONTH)+1;
		int dd =cal.get(Calendar.DATE);
		
		System.out.println(yy+"/"+mm+"/"+dd);
		
		System.out.println(cal.getTimeInMillis());	//
		long unixTime = cal.getTimeInMillis();
		System.out.println(unixTime/1000 + "초");
		
		
		cal.setTimeInMillis(unixTime);
		System.out.println(cal.get(Calendar.YEAR));
		System.out.println(cal.get(Calendar.MONTH)+1);
		System.out.println(cal.get(Calendar.DATE));
		}
}
