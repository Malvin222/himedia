package study2;

import java.util.Scanner;

public class Test1 {

	public static void main(String[] args) {
		//영어점수 영어점수 80점이상 우수 아니면 양호
		int eng = 80;
		String result1 = (eng >=80)?"우수":"양호";
		String result2 = "";
		if ( eng >=80) {
			result2 ="우수";
		} else {
			result2 ="양호";
		}
		
		/* switch( eng = 80 ) {
			case eng>=80 : 
			System.out.println("답은 1"); 
			break;
			case 2 : System.out.println("답은 2");
			break;
			default : System.out.println("답 없음");
		} */
		
		System.out.println(eng+" : "+result1);
		
		int apple = 80;
		String result3 = (apple>=80)?"A등급":(apple>=60)?"B등급":"C등급";
		
		System.out.println("사과 당도 :" +result3);
		
		int number = 10;
		System.out.println((number>0)?"양수":(number<0)?"음수":"0"+"입니다.");
		
		Scanner scn = new Scanner(System.in);
		
		System.out.print("점수입력 : ");
		int score = scn.nextInt();
		
		String result4 = (score>=90)?"A":
						 (score>=80)?"B":
						 (score>=70)?"C":
						 (score>=60)?"D":"F";
		System.out.println(score + "은 : " +result4 + "학점");
	}
}
