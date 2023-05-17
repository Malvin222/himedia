package supplement;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class SubjectDay {
	public static void main(String[] args) throws Exception {
		String path ="C:\\workspace11\\myProject1\\src\\supplement\\SubjectDay.txt";
		FileReader fr = new FileReader(path);
		BufferedReader br = new BufferedReader(fr);
		String rowData= "";
		String saveData = "";	//값 보관 변수
		while(true) {
				rowData = br.readLine();
			if(rowData !=null) {
				rowData = rowData.replace("-", "/");
				saveData +=rowData+"\n";
				System.out.println(rowData);
				}
			else {
				break;
			}
		}
		File file = new File(path); 	//덮어쓸 목적 파일 인식
		FileWriter fw = new FileWriter(file,false); //false: 덮어씀
		fw.write(saveData);
		fw.close();
		System.out.println("변경완료");
	}
}
