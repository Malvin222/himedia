package study14;

import java.io.File;
import java.text.SimpleDateFormat;

public class DirList {
	public static void main(String[] args) {
		//특정 디렉토리(폴더) 안의 파일 목록 출력
		// 파일 및 폴더를 인지하는 클래스
		File dir = new File("C:\\html_test\\html");	//폴더 절대 경로 ->File 클래스
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");	//날짜클래스
		//특정 디렉토리(폴더)의 정보들을 가져옴
		File[]	names =dir.listFiles();	//파일 리스트이름을 배열로 만듦 -> 파일 이름 로딩(읽어옴)
		for(int i=0; i<names.length; i++ ) {
			// 디렉토리 여부
			if(names[i].isDirectory() ) {//디렉토리(폴더)인지 구별 (true,false 판별) //isDirectory() 폴더 판별 메소드
				System.out.print("<폴더>");	//폴더라면 <폴더> 출력
			}else {
				System.out.println("<파일>"); //폴더가 아니라면 <파일> 출력
			}
			System.out.print(names[i].getName()+"	");	//파일 리스트 이름을 출력
			System.out.print(names[i].length()+"	");	//파일 리스트 이름을 출력
			System.out.println(df.format(names[i].lastModified()));// df.format 메소드로 파일 
																	//마지막변경일(lastModified->유닉스 시간)을 날짜형식으로 출력 
		}
	}
}
