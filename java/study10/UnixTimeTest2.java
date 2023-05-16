package study10;

import java.util.Calendar;


/*
 * long u1 = ca1.getTimeInMillis()/1000;
 * date = "2023-12-25"
 * String [] str = date.split("-");
 *	str[0]="2023" str[1]="12" str[2]="25"
 * 
 * int yy=Integer.parseInt(str[0]);
 * int mm=Integer.parseInt(str[1]);
 * int dd=Integer.parseInt(str[2]);
 * cal.set(yy,mm-1,dd);
 * long u2 = cal.getTimeInmillis()/1000;
 * int r1 = (int)(u2-u1)/((60*60*24));
 * return result;
 * 
 */
// 풀어보기3
public class UnixTimeTest2 {
	
	//모든클래스에서 접근가능
	public static int doomDay(String date)  {
		String [] d1 = date.split("-");
		Calendar cal = Calendar.getInstance();
		//지금 시점의 유닉스시간(초단위)
		long u1 = cal.getTimeInMillis()/1000;
		//사용자가 보내준 시점의 유닉스시간(초단위)
		cal.set(Integer.parseInt(d1[0]),Integer.parseInt(d1[1])-1,Integer.parseInt(d1[2]));
		long u2 = cal.getTimeInMillis()/1000;
		
		int result = (int)(u2-u1)/((60*60*24));
		
		return result;
	}
	
	//풀어보기4
	public static int diffDate(String date1, String date2) {
		String [] d1 = date1.split("-");
		String [] d2 = date2.split("-");
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(d1[0]), Integer.parseInt(d1[1])-1,Integer.parseInt(d1[2]));
		long u1 = cal.getTimeInMillis()/1000;
		cal.set(Integer.parseInt(d2[0]), Integer.parseInt(d2[1])-1,Integer.parseInt(d2[2]));
		long u2 = cal.getTimeInMillis()/1000;
		int r1 = (int) (u2-u1)/(60*60*24);
		return r1;
	}
	public static void main(String[] args) {
		//1. 크리스마스 디데이
		//1000/1000 ->
		//a = 지금 시점의 유닉스 시간/1000
		//b =(크리스마스 시점의 유닉스 시간/1000)
		//b-a / 60*60*24 데이계산
		Calendar cal = Calendar.getInstance();
		long u1 = cal.getTimeInMillis()/1000;
		
		cal.set(2023, 11,25);
	
		long u2 = cal.getTimeInMillis()/1000;
		
		int r1 = (int)((u2-u1)/(60*60*24));

		System.out.println("디데이 :"+r1);
		//풀어보기2 
		cal.set(2021,6,1);
		long u3=cal.getTimeInMillis()/1000;
		cal.set(2021, 11,02);
		long u4=cal.getTimeInMillis()/1000;
		
		int r2 = (int)(u4-u3)/((60*60*24));
		System.out.println("디데이: "+r2);
		
		System.out.println(doomDay("2023-05-14"));
		System.out.println(diffDate("2022-05-11","2023-05-11"));	
		
		//풀어보기 5 
		String aa = "1498137807001";
		long a =  Long.parseLong(aa)/1000;
		cal.setTimeInMillis(a*1000);
		cal.add(Calendar.DATE, 60);
		int yy = cal.get(Calendar.YEAR);
		int mm = cal.get(Calendar.MONTH)+1;
		int dd = cal.get(Calendar.DATE);
		System.out.println(yy+"-"+mm+"-"+dd);
		
		String a1 = "1498137807001";
		long b = Long.parseLong(a1)/1000 +((60*60*24)*60);
		cal.setTimeInMillis(b*1000);
		yy = cal.get(Calendar.YEAR);
		mm = cal.get(Calendar.MONTH)+1;
		dd = cal.get(Calendar.DATE);
		System.out.println(yy+"-"+mm+"-"+dd);
		
	
	}
		
	}

