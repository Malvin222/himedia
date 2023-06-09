package post;

import java.io.File;
import java.io.FileWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Scanner;

import comm.DbConnect;

public class PostExportService extends DbConnect{
	
	public static void main(String[] args) throws Exception {
	
		System.out.println("익스포트할 자료 선택 >>");
		System.out.println("1.우편번호자료 \n2.사원정보자료");
		Scanner scn = new Scanner(System.in);
		System.out.println("번호선택>>");
		int number = scn.nextInt();
		
		switch(number) {
			case 1 : postExport();
			break;
			case 2 : empExport();
			break;
			default : System.out.println("없는번호 입니다.");
		}
	}
	
	public static void postExport() throws Exception { 
		
		System.out.println("*** 우편번호정보 다운받는 중 ***");
		
		//DB연결&작업공간생성
		Statement stmt = Connection().createStatement();
		
		//유닉스시간 생성
		Calendar cal = Calendar.getInstance();
		long t1 =cal.getTimeInMillis();
		
		String t1_str = t1+"";
		String filename= "post_"+t1_str.substring(t1_str.length()-5)+".txt";
		System.out.println(filename);
		
		// 생성파일경로
		String downFilePath ="c:/post/"+filename;
		
		//폴더 생성
		String dir = "c:/post";
		File fileDir = new File(dir);
		if(!fileDir.exists()) {
			fileDir.mkdir();
		}
				
		
		/*
		 * 1. 출력 SQL제작
		 * 2. 반복문을 이용하여 입력 내용을 특정 변수에 적재
		 * 3. 적재된 변수를 이용하여 파일 생성
		 */
		
		//Sql
		String sql = "select a1,(a2||' '||a3||' '||a4||' '||a5||' '||a6||' '||a7) addr"
				+ " from post2 ";
		//sql 적용
		ResultSet rs= stmt.executeQuery(sql);
		String content = ""; 
		
		int cnt=0;
		
		while(rs.next()) {
			
			String a1 = rs.getString("a1");
			String addr = rs.getString("addr");
			content += a1+","+addr+"\n";
			
			cnt++;
		} //while close 
			
			File file =new File(downFilePath);
			FileWriter fw = new FileWriter(file,false);
			fw.write(content);
			fw.close();
			
			System.out.println(downFilePath +"로 다운받았습니다.");
			
			//유닉스시간 세팅
			cal = Calendar.getInstance();
			long t2 = cal.getTimeInMillis();
			long t3 = t2 - t1;
			System.out.println(t3/1000 + " 밀리 초");
			System.out.println( "총" + cnt + "행 입력완료" );
		}
	
	public static void empExport() throws Exception { 
		
		System.out.println("*** 회원정보 다운받는 중 ***");
		// 사원번호 사원이름 업무 매니저이름 부서이름 입사일 년차
		
		//DB연결 +작업공간 생성
		Statement stmt = Connection().createStatement();
		
		//유닉스시간 세팅
		Calendar cal = Calendar.getInstance();
		long t1 = cal.getTimeInMillis();
		
		//파일명 제작
		String t1_str = t1+"";
		String filename = "emp_"+t1_str.substring(t1_str.length()-5)+".txt";
		
		//생성파일 경로
		String downFilePath ="c:/temp100/"+filename;
		
		String sql ="select e1.empno empno"
				+ "      ,e1.ename ename"
				+ "      ,e1.job job"
				+ "      ,e2.ename mgrname"
				+ "      ,d.dname dname"
				+ "      ,to_char(e1.hiredate,'yyyy-mm-dd') hiredate"
				+ "      , ( to_char(sysdate,'yyyy' ) - to_char( e1.hiredate,'yyyy' ) ) as year"
				+ "      from emp e1,dept d ,emp e2 "
				+ "            where  e1.deptno = d.deptno"
				+ "                    and e1.mgr = e2.empno";
		//sql 적용
		ResultSet rs = stmt.executeQuery(sql);
		String content = "";
		
		int cnt=0;
		//while문
		while (rs.next()) {
			String empno = rs.getString("empno");
			String ename = rs.getString("ename");
			String job = rs.getString("job");
			String mgrname = rs.getString("mgrname");
			String dname = rs.getString("dname");
			String hiredate = rs.getString("hiredate");
			String year = rs.getString("year");
			
			content +=empno+"\s,"+ename+"\s,"+job+"\s,"+mgrname+"\s,"+dname+"\s,"+hiredate+"\s,"+year+"\n"; 
			cnt++;
		}
		File file = new File(downFilePath);
		FileWriter fw = new FileWriter(file,false);
		fw.write(content);
		fw.close();
		
		System.out.println(downFilePath +"로 다운받았습니다.");
		
		//유닉스시간 세팅
		cal = Calendar.getInstance();
		long t2 = cal.getTimeInMillis();
		long t3 = t2 - t1;
		System.out.println(t3/1000 + " 밀리 초");
		System.out.println( "총" + cnt + "행 입력완료" );
	}
	
}
