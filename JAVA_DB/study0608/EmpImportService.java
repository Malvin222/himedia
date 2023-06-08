package emp;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Statement;
import java.util.Calendar;

import comm.DbConnect;

//[I/O 서비스]
// 1.EmpImportService 
//	-Text 데이터 -> DB Insert
//	-사원번호자동(max(empno)+1)
public class EmpImportService extends DbConnect {
	
	public static void main(String[] args) throws Exception {
		String path = "C:/Text/Emp_Info.txt";
		empImport(path);
	}
	
	public static void empImport(String path) throws Exception{
		
		//DB 연결
		Statement stmt = Connection().createStatement();
		
		Calendar cal = Calendar.getInstance();
		long t1 = cal.getTimeInMillis();
		//경로의 인식
		FileReader file = new FileReader(path);
		BufferedReader buffer = new BufferedReader(file);
		//내용 읽기
		String rowData ="";
		int cnt=0;
		while(true) {
			//rowData = "TEST1 ／ CLERK ／ 7566 ／ 2020-05-05 ／ 250 ／ 0 ／ 40"
			if( (rowData = buffer.readLine()) != null) {
				String[] datas = rowData.split("／");
				  String sql = "insert into emp(empno,ename,job,mgr,hiredate,sal,comm,deptno)"
		                   + "values( (select max(empno)+1 from emp) ,"
		                   + "'"+datas[0]
		                   +"','"+datas[1]
		                   +"','"+datas[2]
		                   +"','"+datas[3]
		                   +"','"+datas[4]
		                   +"',"
		                   + "'"+datas[5]
		                   +"','"+datas[6]+"')";
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
