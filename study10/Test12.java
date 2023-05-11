package study10;

import java.util.Calendar;
import java.util.Scanner;

public class Test12 {
	public static void main(String[] args) {
		
		//랜덤 : 1~100 사이의 값 생성
		//시스템이 얻은 값을 맞추는 문제
		// 0 < x <1 사이의 값을 얻는 메소드
		Calendar cal = Calendar.getInstance();
		Long u1 = cal.getTimeInMillis();
		
		int r =(int) (Math.random()*10+1);
		Scanner scn = new Scanner(System.in);
		int cnt = 0;
		while(true) {
			System.out.print("숫자를 입력하세요");
			int a = scn.nextInt();
			if( r==a ){
				System.out.println("정답");
				break;
			}
			else {
				System.out.println(a +"오답");
				cnt++;
			}
		
			if (cnt ==20) { 
			break; 
			}
		}
		cal = Calendar.getInstance();
		Long u2 = cal.getTimeInMillis();
		long result = u2-u1;
		System.out.println(result/1000+"초 걸림");
	}
}