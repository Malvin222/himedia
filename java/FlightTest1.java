package study14;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class FlightTest1 {
	public static void main(String[] args) throws Exception {
		  String inputFile = "c:/html_test/flight_info.txt";	//생성되는 파일 경로
	       File file100 = new File(inputFile);	//파일생성
	       if( file100.exists() ) {	//파일 존재여부
	            System.out.println("이미 생성된 파일 입니다.");
	            return; // 메소드 종료
	       }
	       String path = "c:/20141125";
	       // 변수 값으로 설정된 폴더경로를 물리적으로 인식시킴
	       File file = new File(path);
	        // 인식된 폴더내의 파일관련 정보를 가져옴
	       File[] names = file.listFiles();
	       for( int i=0; i<names.length; i++ ) {	//전체파일 반복문
	               // 폴더 내의 파일관련 정보에서 파일명을 가져옴
	              String filename = names[i].getName();
	              // 변수 값으로 정의된 파일명을 실제 물리적인 파일로 인식시킴
	              FileReader file1 = new FileReader(path+"/"+filename);
	              // 물리적인 파일을 위치시켜 내용을 읽어들일 수 있는 클래스를 정의함
	              BufferedReader buffer = new BufferedReader(file1);
	              String rowData = "";
	              int cnt = 0;
	              while(true) {
	                   if( (rowData = buffer.readLine()) != null ) {	//파일 내용 반복문
	                          cnt++;
	                          if(cnt==5) {
	                                  // FI OZ309/AN HL7731
	                                  String[] str = rowData.split("/"); // str[1] = "AN HL7731";
	                                  System.out.println( str[1] );
	                                  File file3 = new File(inputFile);
	                                  FileWriter fw = new FileWriter(file3,true);
	                                  fw.write(str[1]+"\n");   
	                                  fw.close();
	                           }
	                   } else {
	                          break;
	                   }
	              }
	         }
	         System.out.println("========= 생성완료 ========");
	}
}
