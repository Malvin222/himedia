package supplement;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;

public class SubjectDay_Switch {
	public static void main(String[] args) throws Exception	 {
		String path = "C:\\workspace11\\myProject1\\src\\supplement\\SubjectDay.txt";
		FileReader fr = new FileReader(path);
		BufferedReader br = new BufferedReader(fr);
		String rowData= "";
		String saveData = "";	//값 보관 변수
		String allData = "";
		while(true) {
				rowData = br.readLine();
				int cnt=0;
				if(rowData !=null) {
					if(rowData.contains("개강2")) {
						//개강2 : 2023/07/10
						String[] str = rowData.split(":");
						str[1]="2023/07/15";
						saveData = str[0]+":"+str[1];	//바뀐 데이터값
				} else {
					allData += rowData+"\n";	//바뀌지 않은 데이터값
				}
				}
			else {
				break;
			}
		}
		allData +=saveData;	//바뀌지 않은 데이터값에 바뀐 데이터값을 더함
		File file = new File(path); 	//덮어쓸 목적 파일 인식
		FileWriter fw = new FileWriter(file,false); //false: 덮어씀
		fw.write(allData);
		fw.close();
		System.out.println("변경완료");
	}
}
