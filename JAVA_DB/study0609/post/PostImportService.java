package post;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Statement;
import java.util.Calendar;

import comm.DbConnect;

public class PostImportService extends DbConnect {
	public static void main(String[] args) throws Exception {
		String path= "c:/temp100/post1.csv";
		postImport(path);
	}
	public static void postImport(String file_path) throws Exception {
		
		
		//DB 연결
		Statement stmt = Connection().createStatement();
		
		Calendar cal = Calendar.getInstance();
		long t1 = cal.getTimeInMillis();
		//경로의 인식
		FileReader file = new FileReader(file_path);
		BufferedReader buffer = new BufferedReader(file);
		//내용 읽기
		String rowData ="";
		int cnt=0;
		while(true) {
			if( (rowData = buffer.readLine()) != null) {
				/*
				 * INSERT SQL문장 데이터에 홑따옴표(')가 섞여있으면 오류
				 * 이런 오류의 방지로 홑따옴표 앞에 홑따옴표를 설정하여 오류를 방지
				 * SQL에서 홑따옴표는 이스케이프문자로 활용됨
				 * 
				 */
				rowData = rowData.replace("'", "''"); //replace(old,new);
				String[] datas = rowData.split(",");
					//210762,강원도,강릉시,연곡면,영진리, ,연곡부영사랑으로2'단지아파트
				  String   sql = "insert into post2 values"
                          + "('"+datas[0]+"'"
                          + ",'"+datas[1]+"'"
                          + ",'"+datas[2]+"'"
                          + ",'"+datas[3]+"'"
                          + ",'"+datas[4]+"'"
                          + ",'"+datas[5]+"'"
                          + ",'"+datas[6]+"' )";
				  
				int result = stmt.executeUpdate(sql);
				if(result ==1) cnt++;

			} else break;
			
		} //while close
		cal = Calendar.getInstance();
		long t2 = cal.getTimeInMillis();
		long t3 = t2 - t1;
		System.out.println(t3 + " 밀리 초");
		System.out.println( "총" + cnt + "건 입력완료" );
		
	}
}
