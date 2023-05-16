package study10;

import java.util.Calendar;

public class CalendarTest1 {
	public static void main(String[] args) {
		//Calendar cal2 = new Calendar();
		Calendar cal = Calendar.getInstance();	//인스턴스화
		int year = cal.get(Calendar.YEAR);
		int month =cal.get(2)+1;
		int date = cal.get(5);
		System.out.println(year+"/"+month+"/"+date);
		
		cal.add(Calendar.DATE, 40);
		year = cal.get(Calendar.YEAR);
		month =cal.get(2)+1;
		date = cal.get(5);
		System.out.println(year+"/"+month+"/"+date);
		
		cal.add(Calendar.MONTH, 3);
		year = cal.get(Calendar.YEAR);
		month =cal.get(2)+1;
		date = cal.get(5);
		System.out.println(year+"/"+month+"/"+date);
		
		cal.add(Calendar.YEAR, 3);
		year = cal.get(Calendar.YEAR);
		month =cal.get(2)+1;
		date = cal.get(5);
		System.out.println(year+"/"+month+"/"+date);
		
		int hh =cal.get(Calendar.HOUR_OF_DAY);
		int mm = cal.get(Calendar.MINUTE);
		int ss = cal.get(Calendar.SECOND);
		System.out.println(hh+"시"+mm+"분"+ss+"초");
	
	System.out.println("am/pm"+cal.get(Calendar.AM_PM) );
	System.out.println("요일"+cal.get(Calendar.DAY_OF_WEEK) );
	System.out.println("올해 몇번째 날"+cal.get(Calendar.DAY_OF_YEAR) );
	System.out.println("올해 몇번째 주"+cal.get(Calendar.WEEK_OF_YEAR) );
	System.out.println("이번 달의 몇번째 주"+cal.get(Calendar.WEEK_OF_MONTH) );
	System.out.println("이번 달의 마지막 날"+cal.getActualMaximum(Calendar.DATE));
	}
}
