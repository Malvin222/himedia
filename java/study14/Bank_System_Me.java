package study14;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

//내가 만들다 중단한 실습예제2 
public class Bank_System {
	public static void main(String[] args) throws Exception {
		String userid = "";
		String deposit = "";
		String withdrawal="";
		int money=0;
		String path ="C:\\workspace11\\myProject1\\src\\study14\\bank.txt";
		Scanner scn = new Scanner(System.in);
		System.out.println("1.입금 2.출금 3.잔액");
		System.out.println("번호를 선택해주세요");
		int n1=scn.nextInt();
		if(n1 ==1) {
		System.out.println("1.입금");
		System.out.println("아이디를 입력해주세요");
		userid = scn.next();
		System.out.println("입금액을 입력해주세요");
		deposit = scn.next();
		System.out.println ("님의 계좌에"+deposit+"원이 입금되었습니다.");
		
		//파일 읽어옴
		String rowData = "";
		String[] str=null;
		FileReader file =new FileReader(path);
		BufferedReader buffer =new BufferedReader(file);
		while(true) {
			if ((rowData = buffer.readLine()) !=null) {
				//아이디 존재여부
				if(rowData.equals(userid)) {
					str=rowData.split(":");
					
					//money =Integer.parseInt()
				}
			}
			
		}
		
		
		}else if(n1 ==2) {
			System.out.println("2.출금");
			System.out.println("아이디를 입력해주세요");
			userid = scn.next();
			System.out.println("출금액을 입력해주세요");
			withdrawal = scn.next();
			System.out.println ("님의 계좌에"+withdrawal+"원이 출금되었습니다.");
		}else if(n1 ==3) {
			System.out.println("3.잔액");
			System.out.println ("님의 잔액은"+money+"원 입니다.");
		}
		
	}
}
