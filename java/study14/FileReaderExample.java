package study14;

import java.io.BufferedReader;
import java.io.FileReader;

public class FileReaderExample {
	public static void main(String[] args) throws Exception{	//예외가 존재하면 예외처리 
		//특정 파일을 인지하는 클래스														//FileReader는 오류가 날수있는 클래스(파일위치)
		FileReader file =new FileReader("C:\\html_test\\html\\1st\\h_test.html");	//파일 위치와 파일명및 확장자까지 적어야함
		//파일안의 내용을 읽어 오는 클래스	(오픈 ->메모리에 할당하여 읽음)
		BufferedReader buffer = new BufferedReader(file);	//버퍼를 사용해서 읽고 씀
		String rowData = "";
		while(true) {
			if((rowData = buffer.readLine()) !=null) {	//rowDate(내용이) buffer.readLine(버퍼를 사용해서 파일 내용을 읽어옴)이 null값이 아니라면 (!->(not))
				System.out.println(rowData);
			}else {
				break;
			}
		}
		file.close();	//읽어 온 파일을 닫음 (메모리 할당 끝)
	}
}
