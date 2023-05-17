package study14;

import java.io.BufferedReader;
import java.io.FileReader;

public class FileCompare {
		//파일 내용 비교	
	public static void main(String[] args) {
		String file1 = "C:\\html_test\\html\\1st\\member_info1.txt";	//경로에 파일이 있어야함
		String file2 = "C:\\html_test\\html\\1st\\member_info2.txt";	//경로에 파일이 있어야함
		try {
			FileReader fr1 =new FileReader(file1);
			BufferedReader br1 =new BufferedReader(fr1);
			
			FileReader fr2 = new FileReader(file2);
			BufferedReader br2 =new BufferedReader(fr2);
			
			String a ="";	//읽어온 내용을 임시로 담는 변수
			String b ="";
			int cnt= 0;	//라인 수
			while(true) {
				if(((a= br1.readLine())!=null)&&((b=br2.readLine())!=null)) {	//a값과 b값을 읽어옴
				cnt++;
					if(!a.equals(b));{	//	a와 b의 값을 비교
					System.out.println(file1 + ":=> " +cnt+"line :"+a);	//info 2파일 출력
					System.out.println(file2 + ":=> " +cnt+"line :"+b);	// info1 파일 출력
					System.out.println();
					}
					}else break;
			}//while문 끝나는 지점
		}catch(Exception e) {
		}
	}
}
