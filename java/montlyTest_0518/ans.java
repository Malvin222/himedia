package montlyTest_0518;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class ans {

	static String path = "c:/html_test/member.txt";
	
	public static boolean errorCheck(String value, int n) {		//value:값 n:id->1 birthday->2 ...
		
		String pattern="";
		if(n==1) {	//아이디
			pattern="^[0-9a-zA-Z]{4,12}";	//정규표현식 우선적으로 ^숫자 영문이오고	4자리에서12자리까지
		}else if (n==2) {	//생년월일
			pattern = "[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}";//0~9까지 4자리
		}else if (n==3) {	//핸드폰
			pattern = "^01(0|1|5)-[0-9]{3,4}-[0-9]{4}";//우선적으로 ^01 오고 0 또는 1 또는 5			
		}
		return value.matches(pattern); 		//값을 패턴에 매치 시킴
	}
	
	public static boolean memberCheck(String id) throws Exception {	//중복체크 메소드
		
		FileReader fr = new FileReader(path);
		BufferedReader br =new BufferedReader(fr);
		
		String rowData = "";
		
		while(true) {
			rowData = br.readLine();
			if(rowData !=null) {
				if(rowData.contains(id+"/")) {
					return false;	// 실행 메소드 종료(false 중복내용 존재)
				}
			}else {
				break;	//null값이라면 반복문 종료->더이상 읽을 데이터가 없다면
			}
		}
		return true; // 사용할수있는 아이디 
	}
	
	public static void memberRegist()throws Exception{
		Scanner scn = new Scanner(System.in);
		System.out.println("---------------");
		System.out.println("[ 등록화면 ]");
		System.out.println("---------------");
		
		String id = "";
		String birthday ="";
		String phone = "";
		
		while(true) {

			System.out.println("아이디>>");
			id = scn.next();
			if(errorCheck(id,1)==false) {	//아이디 유효성체크
				System.out.println("아이디 형식에 맞지 않습니다.");
				continue;	//아래로 내려가지 않고 다시실행
			}
			
			if(memberCheck(id)==false) {	//아이디 중복체크
				System.out.println("이미 사용중인 아이디입니다.");
				continue;	//아래로 내려가지 않고 다시실행
			}
			break;
		}//아이디 반복문 종료
		
		while(true) {	//생년월일 유효성 체크 반복문
			System.out.println("출생일>>");
			birthday = scn.next();
			if(errorCheck(birthday,2)==false) {	//생년월일 유효성체크
				System.out.println("출생일 형식에 맞지 않습니다.");
				continue;	//아래로 내려가지 않고 다시실행
			}
			break;
		}
		
		while(true) {	//핸드폰 유효성 체크 반복문
			System.out.println("핸드폰>>");
			phone = scn.next();
			if(errorCheck(phone,3)==false) {	//핸드폰 유효성체크
				System.out.println("핸드폰 형식에 맞지 않습니다.");
				continue;	//아래로 내려가지 않고 다시실행
			}
				break;
		}
		
		String info = id +"/"+birthday+"/"+phone;
		
		
		File file = new File(path);
		FileWriter fw = new FileWriter(file,true);	//파일 생성
		fw.write(info+"\n");
		fw.close();
		System.out.println("아이디가 생성되었습니다.");
	}
	public static void memberList()throws Exception{
		
	}
	public static void memberDetail()throws Exception{
		
	}
	public static void memberDelete()throws Exception{
		
	}
	
	public static void main(String[] args) throws Exception{
		Scanner scn = new Scanner(System.in);
		System.out.println("1.등록 \n2.목록 \n3.상세 \n4.삭제");
		System.out.println("번호선택>>");
		int number = scn.nextInt();
		
				
			if( number ==1 ) {
				memberRegist();
			}else if(number ==2) {
				memberList();
			}else if(number ==3) {
				memberDetail();
			}else if(number ==4) {
				memberDelete();
			}else {
				System.out.println("번호 선택을 다시해주세요");

		}
	}
}
