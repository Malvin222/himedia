package study10;

import java.util.Calendar;

public class CalendarTest3 {
	public static void main(String[] args) {
		
		Calendar cal = Calendar.getInstance();
		
		cal.set(2023,4,1);
		
		int week = cal.get(Calendar.DAY_OF_WEEK); //2
		int lastDay = cal.getActualMaximum(Calendar.DATE);// 이번달 마지막날짜
		int ln = 0;
		for(int w=1; w<week;w++) {
			System.out.print("     ");
			ln++;
		}
		
		for(int d=1; d<=lastDay;d++) {
			if(d<10) {
				System.out.print("0");
			}
			System.out.print(d+"일 ");
			ln++;	//d=1 ln=2, d=2 ln=3
			if(ln==7) {
				System.out.println();	//개행
				ln=0;
			}
		}
	}
}
