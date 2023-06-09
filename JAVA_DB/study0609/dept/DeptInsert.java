package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DeptInsert {

	public static void main(String[] args) throws Exception {
	      String url = "jdbc:oracle:thin:@//localhost:1522/xe";
	      String username = "c##java";
	      String userpass = "1234";
	      
	      Class.forName("oracle.jdbc.OracleDriver");
	      Connection con = DriverManager.getConnection(url,username,userpass);
	      Statement stmt = con.createStatement(); //데이터 베이스에서 로딩, 수정
	      
	      Scanner scn = new Scanner(System.in);
	      System.out.println("-- 부서정보 입력--");
	      System.out.println("1.부서번호>>");
	      String deptno = scn.next();
	      
	      String sql2 = "select count(*) cnt from dept"
	      				+" where deptno='"+deptno+"'";
	      ResultSet rs2 = stmt.executeQuery(sql2); //
	      rs2.next();	//존재유무 + 커서(포인트)를 아래로 내림
	      
	      int cnt = rs2.getInt("cnt");
	      if(cnt>0) {
	    	  System.out.println("이미 사용중인 번호입니다.");
	    	  System.out.println("종료합니다.");
	    	  return;
	      }
	      System.out.println("2.부서이름>>");
	      String dname = scn.next();
	      System.out.println("3.부서위치>>");
	      String loc = scn.next();
	      
	      
	      String sql= "insert into dept(deptno,dname,loc)"
	      				+"values ('"+deptno+"','"+dname+"','"+loc+"')"; //데이터 삽입
	      int result = stmt.executeUpdate(sql);	//executeUpdate : 데이터 입력,업데이트,제거
	      if(result>0) {
	    	  System.out.println("저장완료");
	      }
	    	  else {
	    		System.out.println("저장실패");	
	    	  }
	      }
	}
	
