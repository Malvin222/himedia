package study14;

import java.io.File;

public class FileDelete {
		//파일 삭제 클래스
	public static void main(String[] args) {
		String path = "C:\\html_test\\html\\1st\\member_info_Test.txt"; //경로 (/(슬래쉬라면 한개)\\(역슬래쉬라면 두개)
		File file = new File(path);	//임포트
		if(file.exists()) {	//파일 존재 여부 메소드(file 클래스 안에 들어감)
			if(file.delete()) {	//파일 및 폴더 삭제 메소드	(file 클래스 안에 들어있음)
				System.out.println("삭제 o ");
			}else {
				System.out.println("삭제 x");
			}
		}else{
		System.out.println("파일 존재 x");
		}
		//		file.mkdir(); //폴더 생성 메소드
	}
}
