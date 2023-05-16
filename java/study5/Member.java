package study5;

import java.util.Calendar;

public class Member {
	
		//void가 있는 메소드 :return 키워드가 필요없는 메소드
	
	public static void main(String[] args) {
		System.out.println("회원 이름 : "+memberName());
		System.out.println("회원 나이 : "+memberAge());
		System.out.println("회원 생일 : "+memberBirth());
		System.out.println("오늘 날짜 : "+today());
		System.out.println("원주율 : "+abc());
	
		Math.max(10, 20);
		loop10.loop10();
	}
	
		//void가 없는 메소드 : return 키워드가 반드시 필요한 메소드
		//					void 대신 reuturn 타입 작성
		// return : 호출한 위치로 값을 던지는 기능
	public static String memberName() {
		return "홍길동";
	}
	public static int memberAge() {
		return 25;
	}
	public static String memberBirth() {
		return "1998-12-25";
	}
	public static String today() {
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	int date = cal.get(Calendar.DATE);
	return year+"-"+month+"-"+date;
	
	}
	public static double abc() {
		return 3.14;
	}
}
