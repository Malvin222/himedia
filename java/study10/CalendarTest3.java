package study10;

import java.util.Calendar;

public class CalendarTest3 {
	
	public void calView(String call) {
	String [] cal1 = call.split("-");
	int yy = Integer.parseInt(cal1[0]);
	int mm = Integer.parseInt(cal1[1]);
	System.out.println(yy+"년"+mm+"월\n");
	//인스턴스(객체)화
	Calendar cal = Calendar.getInstance();
	//출력 날짜 세팅
	cal.set(yy,mm-1,1);	//2023-03-01

	//세팅 날짜의 요일
	int week = cal.get(Calendar.DAY_OF_WEEK); //4 (수)
	//세팅 날짜의 마지막일 얻음 //31
	int lastDay = cal.getActualMaximum(Calendar.DATE);// 이번달 마지막날짜
	// 날짜 출력 시 한줄에 7칸을 맞추는 용도
	int ln = 0;
	//달력의 첫날(1일) 출력전의 공백 발생
	for(int w=1; w<4;w++) {
		System.out.print("\t");
		ln++;
	}
	
	for(int d=1; d<=lastDay;d++) {
		if(d<10) {
			System.out.print("\s");
		}
		System.out.print(d+"일\t");
		ln++;	//d=1 ln=2, d=2 ln=3
		if(ln==7) {
			System.out.println();	//개행
			ln=0;
		}
	}
	return;
	}
	public static void main(String[] args) {
		CalendarTest3 aa =new CalendarTest3();
		aa.calView("2023-3");
		
	}
}
