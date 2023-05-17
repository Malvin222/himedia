package study14;

import java.io.File;
import java.io.FileWriter;
import java.util.Scanner;

public class FileWriterTest {
		//파일 생성
	public static void main(String[] args) {
		//스캐너
		Scanner scn = new Scanner(System.in);
		System.out.println("userid를 입력해주세요");
		String userid = scn.next();
		System.out.println("password를 입력해주세요");
		String password =scn.next();
		
		String txt = "\nuserid: "+userid+"\n"+"password: "+password+"\n";		//파일 내용 (수정후 저장하면 변경사항 저장(새롭게 추가적으로 작성됨))
		String fileName = "C:\\html_test\\html\\1st\\member_info.txt";
		try {
			//파일 및 폴더를 인지하는 클래스
			File file = new File(fileName);
			//해당 위치에 파일 생성 및 input 클래스	(input = 입력)
			FileWriter fw = new FileWriter(file,true);	//true는 이어쓰기 , false는 덮어쓰기
			//input(txt 변수에 입력된 값)
			fw.write(txt);	
			System.out.println("생성완료");
			fw.close();
		}catch(Exception e) {
			
		}	
	}
}
