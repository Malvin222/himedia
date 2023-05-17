package study14;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class FileQ {
	public static void main(String[] args) throws Exception {
		String path = "C:\\20141125";
		File dir =new File(path);
		File []	names = dir.listFiles();
		String rowData = "";
		String flight="";
		String fileName = "C:\\20141125\\flight.txt";
		for(int i=0;i<names.length;i++) {
			FileReader file =new FileReader(names[i]);
			BufferedReader buffer = new BufferedReader(file);	//버퍼를 사용해서 읽고 씀
			while(true) {
				if((rowData = buffer.readLine())!=null) {	//rowDate(내용이) buffer.readLine(버퍼를 사용해서 파일 내용을 읽어옴)이 null값이 아니라면 (!->(not))
					if(rowData.contains("AN")) {
						rowData= rowData;
						String [] Data =rowData.split("/");
						flight+=Data[1]+"\n";
					}
				}else {
					break;
				}
			}
			file.close();	//읽어 온 파일을 닫음 (메모리 할당 끝)
		}
		File file = new File(fileName);
		FileWriter fw = new FileWriter(file,true);
		fw.write(flight);
		System.out.println("생성완료");
		fw.close();
	}
}
