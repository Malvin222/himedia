package study3;

import java.util.Scanner;

public class and_or {

	public static void main(String[] args) {
		
		int time = 18;
		if (time != 18) {
		System.out.print("지금은 퇴근 시간이 아님.");
		}else {
			System.out.print("퇴근시간");
		}
		System.out.println("---------");
		boolean result = true; //true or false;  (1==1);
		if (!result) {
			System.out.println("11");
		}else {
			System.out.println("2");
			}
		
		System.out.println("---------");
		int kor = 10;
		int eng = 70;
		if(kor >= 60 && eng >= 70) {
			System.out.println("합격");
		}else if (kor>=60 && eng<70 || kor<60 && eng>= 60) {
			System.out.println("재시험");
		}else {
			System.out.println("불합격");
			}
		
		System.out.println("---------");
		
		int math = 87;
		String hak="";
		if(math >= 0 && math <60) {
			hak ="F학점";
		}else if (math >=60 && math<70){
			hak ="D학점";
		}else if (math>=70 && math<80) {
			hak ="C학점";
		}else if (math>=80 && math<90) {
			hak ="B학점";
		}else if (math>=90 &&math<=100) {
			hak ="A학점";
		}
		 System.out.println("수학점수는 "+math+"로 "+hak+" 입니다.");
		System.out.println("---------");
		


		int var = 30;
		if (var%2==0 && var%10==0) {
			System.out.println("짝수이고 10의 배수입니다.");
		}else if (var%2!=0 && var%10==0) {
			System.out.println("홀수이고 10의 배수입니다.");
		}else if(var%2==0 && var%10!=0){
			System.out.println("짝수이고 10의 배수가 아닙니다.");
		}else if(var%2!=0 && var%10!=0) {
			System.out.println("홀수이고 10의 배수가 아닙니다.");
		}
		
		System.out.println("---------");
		
		Scanner scn = new Scanner(System.in);
		String pg ="";
		System.out.println("페이지를 입력해주세요");
		int page =scn.nextInt();
		if(page>0 && page<11) {
			pg="1페이지";
		}else if (page>=11 && page<21) {
			pg= "2페이지";
		}else if(page>=21 && page<31) {
			pg="3페이지";
		}else {
			System.out.println("잘못된 숫자입력");
			return;
		}
		System.out.println("입력된 값은 "+page+"로 "+pg+" 입니다");
		
		System.out.println("---------");
		// 1~ 10 ->1  ;;;; 11~20-> 2 ;;;;
		Scanner scn1 = new Scanner(System.in);
		System.out.println("페이지를 입력해주세요");
		int n3 = scn1.nextInt();
		int page2 = ((n3-1)/10) +1;
		System.out.println("입력된 값은 "+n3+"로 "+page2+"페이지 입니다.");
		
		
		
	}

}
