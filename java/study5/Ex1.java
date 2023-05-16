package study5;

import java.util.Scanner;

public class Ex1 {

	public static void main(String[] args) {
	//룸사이즈
		Scanner scn = new Scanner(System.in);
		System.out.println("사이즈를 입력해주세요");
		double size = scn.nextDouble();
		roomSize1(size);
		System.out.println("--------");
	//사칙연산

		int a1 = 100;
		int b1 = 20;
		System.out.println("연산기호를 입력해주세요");
		String c1 = scn.next();
		myCalc1(a1,b1,"c1");//myCalcul(a,b,"+");
		System.out.println("--------");
	//시험	
		System.out.println("a2 점수를 입력해주세요");
		int a2 =scn.nextInt();
		System.out.println("b2 점수를 입력해주세요");
		int b2 =scn.nextInt();
		Exam1(a2,b2);
		System.out.println("--------");
	//배열 값
		int[] score = {60,70,80,68,78};
		System.out.println("점수의 합:" +arraySum1(score));
		
	}
	// 평방 메소드
	public static void roomSize1(double size){
		double roomSize = (double) size*0.3025;
		System.out.println("입력하신 "+size+"평방미터는 "+roomSize+"평 입니다.");
	}
		
	// 사칙연산 메소드
	public static void myCalc1(int a,int b, String c) {
		String ca = "";
		int result = a;
		if (c == "+") {
			ca = "+";
			result = a+b;
		}else if(c =="-") {
			ca = "-";
			result = a-b;
		}else if (c == "/") {
			ca = "/";
			result = a/b;
		}else if (c =="*") {
			ca ="*";
			result = a*b;
		}

		System.out.println("a"+ca+"b = "+result);
	}
	
    //시험 메소드
	public static void Exam1(int a ,int b) {
		String E= "";
		if(a>=60&&b>=60) {
			E = "합격";
		}else if (a>=60||b>=60) {
			E = "재시험";
		}else {E = "불합격";}
		System.out.println("a과목 "+a+", b과목 "+b+"로 "+E+" 입니다.");
		}
	//배열 메소드
	public static int arraySum1(int[] jumsu) {
		int sum = 0;
		for(int i=0;i<jumsu.length;i++) {

			sum = sum+jumsu[i]; 
		
		}
		return sum;
	}
}
