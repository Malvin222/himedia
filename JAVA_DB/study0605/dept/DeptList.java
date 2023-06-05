package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class DeptList {
	public static void main(String[] args) throws Exception {
	      String url = "jdbc:oracle:thin:@//localhost:1522/xe";
	      String username = "c##java";
	      String userpass = "1234";
	      
	      Class.forName("oracle.jdbc.OracleDriver");
	      Connection con = DriverManager.getConnection(url,username,userpass);
	      Statement stmt = con.createStatement(); //데이터 베이스에서 로딩, 수정
	      
	      
	      String sql2 = "select count(*)  cnt from dept";
	      ResultSet rs2 = stmt.executeQuery(sql2); //
	      rs2.next();	//존재유무 + 커서(포인트)를 아래로 내림
	      int total =rs2.getInt("cnt");
	     
	      
	      String sql = "select deptno,dname,loc from dept"
  		  		+" order by deptno asc";
	      ResultSet rs = stmt.executeQuery(sql);
	      
	      
	      System.out.println("[부서목록] 총:"+total+"개");
	      System.out.println("-----------------------");
	      
	      if(rs.next()) {
	    	  	String deptno = rs.getString("deptno");
	    	  	String dname = rs.getString("dname");
	    	  	String loc = rs.getString("loc");
	    	  	System.out.println(deptno + "," + dname + "," + loc);
	      }
	}
}	