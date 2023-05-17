package study14;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

//실습예제1 내가 작성한 코드
public class FileQ {
	public static void main(String[] args) throws Exception {
		String path = "C:\\20141125";
		File dir =new File(path);
		File []	names = dir.listFiles(); //경로 파일 리스트
		String rowData = "";
		String flight="";	//플라이트 빈 공간할당
		String fileName = "C:\\20141125\\flight.txt";
		for(int i=0;i<names.length;i++) {
			FileReader file =new FileReader(names[i]);
			BufferedReader buffer = new BufferedReader(file);	//버퍼를 사용해서 읽고 씀
			while(true) {
				if((rowData = buffer.readLine())!=null) {	//rowDate(내용이) buffer.readLine(버퍼를 사용해서 파일 내용을 읽어옴)이 null값이 아니라면 (!->(not))
					if(rowData.contains("AN")) {	//AN문자가 존재하는 라인 판별
						rowData= rowData;	//AN문자 라인 가져옴
						String [] Data =rowData.split("/");	//스플릿 처리
						flight+=Data[1]+"\n";	//"/"뒷편 문자열 가져와서 flight변수에 저장
					}
				}else {
					break;
				}
			}
			file.close();	//읽어 온 파일을 닫음 (메모리 할당 끝)
		}
		File file = new File(fileName);	//flight.txt 파일 생성
		FileWriter fw = new FileWriter(file,true); //flight.txt 파일 생성
		fw.write(flight);	//flight 변수 내용 입력
		System.out.println("생성완료");
		fw.close();
	}
}
