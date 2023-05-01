package study2;

import java.util.Scanner;

public class Test9_L {

	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		
		cc:while(true) {
		
			System.out.println("= 드시려는 커피번호를 입력해주세요.=");
			System.out.println("1.아메리카노");
			System.out.println("2.라떼");
			System.out.print("커피번호>>");
			int n1 = scn.nextInt();
			String coffee = "";
			if(n1 == 1 ) {
				coffee = "아메리카노";
				
				System.out.println("==아메리카노를 선택했습니다.==");
				System.out.println("1.설탕 넣기");
				System.out.println("2.설탕 없음");
				System.out.print("*설탕번호>>");
				int n2 = scn.nextInt();
				String sweet = "";
				if(n2 == 1 ) {
					sweet = "당도 1";
					System.out.println(sweet+" "+coffee+"가 나왔습니다");
					break cc;
				}else if(n2 == 2 ) {
					sweet = "당도 0";
					System.out.println(sweet+" "+coffee+"가 나왔습니다");
					break cc;
				}else {System.out.println("없는 번호입니다.");}
				
			} else if (n1 == 2 ){
				coffee ="라떼";
				System.out.println("==라떼를 선택했습니다.==");
				System.out.println("1. 프림1+설탕 1 (연한맛)");
				System.out.println("2. 프림2+설탕 2 (단맛)");
				System.out.println("3. 프림3+설탕3 (아주단맛)");
				System.out.print("*선택번호>>");
				int n3 = scn.nextInt();
				String sweet2 = "";
				if(n3 == 1 ) {
					sweet2 ="연한맛";
					System.out.println(sweet2+"의 "+coffee+"가 나왔습니다.");
					break cc;
				}else if(n3 == 2 ) {
					sweet2 = "단맛";
					System.out.println(sweet2+"의 "+coffee+"가 나왔습니다.");
					break cc;
				}else if(n3 == 3 ) {
					sweet2 = "아주단맛";
					System.out.println(sweet2+"의 "+coffee+"가 나왔습니다.");
					break cc;
				} else {System.out.println("없는 번호 입니다.");}
	
				
			} else { System.out.println("없는 번호입니다.");}
		}
	} 

}
