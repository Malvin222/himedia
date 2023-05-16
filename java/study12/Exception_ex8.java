package study12;

import java.util.InputMismatchException;
import java.util.Scanner;
//예제 8
public class Exception_ex8 {
	public static void main(String[] args) {
		int answer = (int)(Math.random()*100)+1;	//1~100사이의 난수 저장(시스템값)
		int input = 0;	//사용자가 입력하는 숫자(사용자값)
		int count =0;	//회수 계산값
		Scanner scn;
		while(true) {		//조건 없이 무한 반복
			try {
				count++;	//횟수 증가
				scn = new Scanner(System.in);
				System.out.println("1~100 insert");
				
				input = scn.nextInt();
				if(answer > input) {	//if(시스템값>사용자값)
					System.out.println("more big");
				}else if (answer<input) {	//if(시스템값<사용자값)
					System.out.println("more small");
				}else {
					System.out.println("ok~~");
					System.out.println(count+"회에 맞춤");
					break;	//반복문 종료
				}
			}catch(InputMismatchException e ){	//문자입력시 오류 int변수 String값입력
				System.out.println("숫자만 입력해주세요.");
			}
		}
	}
}
