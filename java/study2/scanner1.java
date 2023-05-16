package study2;

import java.util.Scanner;

public class scanner1 {

	public static void main(String[] args) {
		
		Scanner scn = new Scanner(System.in);
		System.out.print("성별을 입력해주세요 : ");
	
		String gender = scn.next();
		String str = "";
		
		if(gender.equals("M")) str="남성";		
		else if(gender.equals("F")) str = "여성";
		else str = "잘못된 코드";	
		System.out.println("A씨의 성별코드는 "+gender+"로 "+str+"입니다.");	
	
	}

}
