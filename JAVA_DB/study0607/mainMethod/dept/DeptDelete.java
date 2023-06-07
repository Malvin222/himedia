package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class DeptDelete {
	public static void main(String[] args) throws Exception {
	      String url = "jdbc:oracle:thin:@//localhost:1522/xe";
	      String username = "c##java";
	      String userpass = "1234";
	      
	      Class.forName("oracle.jdbc.OracleDriver");
	      Connection con = DriverManager.getConnection(url,username,userpass);
	      Statement stmt = con.createStatement(); //데이터 베이스에서 로딩, 수정
	      Scanner scn = new Scanner(System.in);
	     
	      System.out.println("-- 삭제 부서정보 입력--");
	      System.out.println("1.부서번호>>");
	      String deptno = scn.next();
	      
	      //값의 존재 유무
	      String sql2 = "select count(*) cnt from dept"
    				+" where deptno='"+deptno+"'";
			 ResultSet rs2 = stmt.executeQuery(sql2); //
		   rs2.next();	//존재유무 + 커서(포인트)를 아래로 내림
	     
		    int cnt = rs2.getInt("cnt");
		    if(cnt==0) {
		    	  System.out.println("동일한 부서번호가 없습니다.");
		    	  System.out.println("종료합니다.");
		    	  return;
		      }

	      String sql= "delete from dept "
	      				+" where deptno='"+deptno+"' "; //데이터 삽입
	      int result = stmt.executeUpdate(sql);	//executeUpdate : 데이터 입력,업데이트,제거
	      
	      if(result>0) {
	    	  System.out.println("삭제 완료");
	      }
	    	  else {
	    		System.out.println("삭제 실패");	
	    	  }
	      }
	}
	
