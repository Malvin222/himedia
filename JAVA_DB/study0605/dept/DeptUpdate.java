package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class DeptUpdate {
	public static void main(String[] args) throws Exception {
		   String url = "jdbc:oracle:thin:@//localhost:1522/xe";
		      String username = "c##java";
		      String userpass = "1234";
		      
		      Class.forName("oracle.jdbc.OracleDriver");
		      Connection con = DriverManager.getConnection(url,username,userpass);
		      Statement stmt = con.createStatement(); //데이터 베이스에서 로딩, 수정
		      
		      Scanner scn= new Scanner(System.in);
		      System.out.println("변경 부서 정보 입력>>");
		     
		      
		      System.out.println("1.수정 부서번호>>");
		      String deptno = scn.next();
		     
		      String sql2 ="select count(*) cnt from dept "
		    		  		+"where deptno ='"+deptno+"'";
		      ResultSet rs2 = stmt.executeQuery(sql2);
		      rs2.next();
		      int cnt = rs2.getInt("cnt");
		      if(cnt==0) {
		    	  System.out.println("동일한 부서번호가 없습니다.");
		    	  System.out.println("종료합니다.");
		    	  return;
		      }
		      
		      System.out.println("2.부서이름>>");
		      String dname = scn.next();
		      
		      
		      System.out.println("3.부서위치>>");
		      String loc = scn.next();
		      
		      String sql= " update dept set dname='"+dname+"',loc='"+loc+"' "
		      				+" where deptno ='"+deptno+"' "; //데이터 삽입
		      int result = stmt.executeUpdate(sql);	//executeUpdate : 데이터 입력,업데이트,제거
		      if(result>0) {
		    	  System.out.println("변경 완료");
		      }
		    	  else {
		    		System.out.println("변경 실패");	
		    	  }
		      }
		}
		
