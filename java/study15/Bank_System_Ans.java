package study15;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Scanner;

public class Bank_System_Ans {
	
	
	//입금메소드
	public static void bankPlus() throws Exception {
		Scanner scn =new Scanner(System.in);
		String path ="C:\\workspace11\\myProject1\\src\\study14\\bank.txt";	//파일경로
		FileReader fr = new FileReader(path); //파일 경로 인식
		BufferedReader br = new BufferedReader(fr); //파일을 읽어옴
		
		System.out.println("\n\n[ 입금화면 ] \n");
		System.out.println("아이디 >>");
		String id =scn.next();
		System.out.println("입금액 >>");
		int money = scn.nextInt();
		
		String rowData = "";	//읽은 파일 한줄 값이 저장되는 변수
		String otherData = "";	//다른 아이디 값 및 돈이 저장되는 변수
		String myData = "";		//사용자가 입력한 id와 money가 저장되는 변수
		int sumMoney = 0;		//사용자가 입력한 돈과 기존 금액이 합쳐져서 저장되는 변수
		
		while(true) {
			if((rowData = br.readLine())!=null) {	//null이 아닌경우 실행
				if(rowData.indexOf(id+":")>-1) {	//id 입력값 서치 및 존재시
					String[] str = rowData.split(":");	//":"구분자로 앞뒤 자름
					sumMoney =money + Integer.parseInt(str[1]); //":"뒷부분 money부분을 정수값으로 가져와서 기존 금액에 합침
					myData = id+":"+sumMoney;
				}else {
					otherData += rowData+"\n";	// "\n"->줄바꿈
				}
				
			}else {
				break;	//while반복문 종료
			}			
		}
		if(myData.equals("")) {	
			myData = id+":"+money;
		}
		File file = new File(path);
		FileWriter fw = new FileWriter(file,false); //파일 문서 내용을 덮어쓰기 용도로 클래스를 사용가능 상태로 만듦
		fw.write(otherData+myData);
		fw.close();
		System.out.println(id+"님의 계좌에 "+money+"원이 입금되었습니다.");
	}
	
	
	//출금메소드
	public static void bankMinus() throws Exception{
		Scanner scn =new Scanner(System.in);
		String path ="C:\\workspace11\\myProject1\\src\\study14\\bank.txt";	//파일경로
		FileReader fr = new FileReader(path); //파일 경로 인식
		BufferedReader br = new BufferedReader(fr); //파일을 읽어옴
		
		System.out.println("\n\n[ 출금화면 ] \n");
		System.out.println("아이디 >>");
		String id =scn.next();
		System.out.println("출금액 >>");
		int money = scn.nextInt();
		
		String rowData = "";	//읽은 파일 한줄 값이 저장되는 변수
		String otherData = "";	//다른 아이디 값 및 돈이 저장되는 변수
		String myData = "";		//사용자가 입력한 id와 money가 저장되는 변수
		int sumMoney = 0;		//사용자가 입력한 돈과 기존 금액이 합쳐져서 저장되는 변수
		
		while(true) {
			if((rowData = br.readLine())!=null) {	//null이 아닌경우 실행
				if(rowData.indexOf(id+":")>-1) {	//id 입력값 서치 및 존재시
					String[] str = rowData.split(":");	//":"구분자로 앞뒤 자름
					sumMoney =Integer.parseInt(str[1])-money; //":"뒷부분 money부분을 정수값으로 가져와서 기존 금액에 합침
					if(sumMoney <0) {	//잔액부족 조건문
						System.out.println(id+"님의 현재 잔액이 부족합니다.");
						return;
					}
					myData = id+":"+sumMoney;
				}else {
					otherData += rowData+"\n";	// "\n"->줄바꿈
				}
				
			}else {
				break;	//while반복문 종료
			}			
		}
		if(myData.equals("")) { //등록되어있지 않은 사용자인 경우
			System.out.println("등록 되었지 않은 사용자 입니다.");
			return; //등록되어있지 않으면 리턴 메소드 종료
		}
		File file = new File(path);
		FileWriter fw = new FileWriter(file,false); //파일 문서 내용을 덮어쓰기 용도로 클래스를 사용가능 상태로 만듦
		fw.write(otherData+myData);
		fw.close();
		System.out.println(id+"님의 계좌에 "+money+"원이 출금되었습니다.");
		
	}

	//잔액 메소드
	public static void bankNow() throws Exception{
		Scanner scn =new Scanner(System.in);
		String path ="C:\\workspace11\\myProject1\\src\\study14\\bank.txt";	//파일경로
		FileReader fr = new FileReader(path); //파일 경로 인식
		BufferedReader br = new BufferedReader(fr); //파일을 읽어옴
		
		System.out.println("\n\n[ 잔액조회 ] \n");
		System.out.println("아이디 >>");
		String id =scn.next();
		
		String rowData = "";	//읽은 파일 한줄 값이 저장되는 변수
		String otherData = "";	//다른 아이디 값 및 돈이 저장되는 변수
		String myData = "";		//사용자가 입력한 id와 money가 저장되는 변수
		int sumMoney = 0;		//사용자가 입력한 돈과 기존 금액이 합쳐져서 저장되는 변수
		
		while(true) {
			if((rowData = br.readLine())!=null) {	//null이 아닌경우 실행
				if(rowData.indexOf(id+":")>-1) {	//id 입력값 서치 및 존재시
					String[] str = rowData.split(":");	//":"구분자로 앞뒤 자름
					sumMoney =Integer.parseInt(str[1]); //":"뒷부분 money부분을 정수값으로 가져와서 기존 금액에 합침
					myData = id+":"+sumMoney;
				}else {
					otherData += rowData+"\n";	// "\n"->줄바꿈
				}
				
			}else {
				break;	//while반복문 종료
			}			
		}
		if(myData.equals("")) {
			System.out.println("미등록 사용자입니다.");
			return;
		}
		File file = new File(path);
		FileWriter fw = new FileWriter(file,false); //파일 문서 내용을 덮어쓰기 용도로 클래스를 사용가능 상태로 만듦
		fw.write(otherData+myData);
		fw.close();
		System.out.println(id+"님의 현재 잔액은 "+sumMoney+"원 입니다.");
	}
	
	public static void main(String[] args) throws Exception {
		Scanner scn = new Scanner(System.in);
		System.out.println("1.입금 2.출금 3.잔액");
		System.out.println("번호선택>>");
		int nn =scn.nextInt();
		if (nn == 1 ) {
			bankPlus();
		}else if ( nn==2 ) {
			bankMinus();
		}else if(nn==3){
			bankNow();
		}else {
			System.out.println("잘못된 입력값입니다");
		}
		
	}
}
