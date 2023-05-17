package study14;

import java.io.File;

public class FileMakeDir {
	//폴더 생성
	public static void main(String[] args) {
		String path = "C:\\html_test\\html\\11"; //경로 (/(슬래쉬라면 한개)\\(역슬래쉬라면 두개)
		File file = new File(path);	//임포트
		file.mkdir();	//폴더 생성 메소드
		System.out.println("생성성공");
		
	}
}
