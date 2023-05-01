package study3;

import java.util.Calendar;
import java.util.Scanner;

public class for_ex1 {

	public static void main(String[] args) {
		
		for(int i=1; i<7; i++) {
			System.out.println("javascript");
		}
		System.out.println("------------");
		for(int n1=1; n1<=100;n1++) {
			if(n1%2==1) {
				System.out.print(n1+" ");
			if(n1==99) {
				System.out.println("");
			}
			}
		}
		System.out.println("------------");
		
		
		for(int s1=1; s1<=3; s1++) {
			if (s1<=2) {
				System.out.println("문항 "+s1+" : 정답");
			}else {
				System.out.println("문항 "+s1+" : 오답");
			}
		}
		System.out.println("------------");
		Calendar cal = Calendar.getInstance();
		for(int y=2021;y<=2025;y++) {
			if(y==2023) {
				System.out.print("(2023년) ");
			}else {
				System.out.print(y+"년 ");
			}
		}
		System.out.println("------------");
		
		Scanner scn = new Scanner(System.in);
		System.out.println("단수를 입력해주세요");
		int g1 = scn.nextInt();
		System.out.println(g1+"단");
		for (int g2=1;g2<=9;g2++) {
			int result = g1 *g2;
			System.out.println(g1+"*"+g2+" = "+result);
		}
		
		System.out.println("------------");
		
		System.out.print("별개수를 입력해주세요");
		int cnt = scn.nextInt();
		for (int s=1;s<=cnt;s++){
			System.out.print("*");
		}
	
	}

}
