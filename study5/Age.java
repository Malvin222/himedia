package study5;

import java.util.Calendar;

public class Age {


	public static void main(String[] args) {
		int year = 1990;
		System.out.println("나이 : "+myAge1(year));
	}
	//byte(127) < short(32000) < int < long
	
	public static byte myAge1(int a){   //매개변수 : 외부값을 받는 변수
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int age = year - a;
		return (byte)age;
	}

}
