package study3;

import java.util.Scanner;

public class switch1 {

	public static void main(String[] args) {
		
		int pay = 100;
		int level = 1; //연차

		switch (level){
			case 1 : pay +=10;
			break;
			case 2 : pay+=20;
			break;
			default : pay+=30;
		}
		System.out.println("급여는 " +pay + "만원 입니다.");
		
		System.out.println("---------");
		
		int number = 33;
		switch(number%5) {
			case 0: System.out.println(number + "는 5의 배수 입니다.");
				break;
			default : System.out.println(number + "는 5의 배수가 아닙니다.");

		}
		
		System.out.println("---------");
		
		String season = "여름";
		String str="";
		System.out.println("설정한 계절은 몇월 ~몇월인가요?");
		switch(season) {
			case "봄" : str ="3월 ~ 5월";
				break;
			case "여름" :str ="6월 ~ 8월";
				break;
			case "가을" :str = "9월 ~ 11월";
				break;
			case "겨울" :str = "12월 ~ 2월";
				break;
			default: str ="없는 값";
		}
		System.out.println(season +"은 "+str +"입니다.");
		
		System.out.println("---------");
		
		Scanner scn = new Scanner(System.in);
		System.out.println("연산자를 입력해주세요");
		int a = 3;
		int b = 2;
		int result=0;
		String sign = scn.next(); //문자열 입력가능 상태
		switch(sign) {
			case "+": result = a+b;
				break;
			case "-": result = a-b;
				break;
			case "*": result = a*b;
				break;
			case "/": result = a/b;
				break;
			default : System.out.println("입력한 연산자가 적절하지 않습니다.");
		}
		System.out.println("a"+sign+"b="+result);
			
	}

}
