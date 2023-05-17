package supplement;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Calendar;

public class Age_T1 {
	public static void main(String[] args) throws Exception {
		
		String path ="C:\\workspace11\\myProject1\\src\\supplement\\Age_T1.txt";
		FileReader fr = new FileReader(path);	//파일 위치 인식
		BufferedReader br = new BufferedReader(fr);	//파일 내용 읽어옴
		String rowData = "";
		while(true) {
			if((rowData=br.readLine())!=null) {
				int year = Integer.parseInt(rowData.substring(0,4)); //0~3번까지 범위
				System.out.println(year);
				year = 2023-year;
			}else {
				break;
			}
		}	//while 반복문 종료
	}
}
