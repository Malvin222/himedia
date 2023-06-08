package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class DeptList extends DbConnect{
	
	public static void main(String[] args) throws Exception {
		  
		  //접속내용의 인스턴스(객체)화 = 작업공간 생성
	      Statement stmt = Connection().createStatement(); //데이터 베이스에서 로딩, 수정
	      
	      
	      String sql2 = "select count(*)  cnt from dept";
	      //SQL 적용 ->데이터를 가져올때는 타입은 항상 ResultSet
	      ResultSet rs2 = stmt.executeQuery(sql2); //
	      rs2.next();	//존재유무 + 커서(포인트)를 아래로 내림
	      //getInt에 count(*) 이 들어가지 않아 as 로 cnt를 빼내야함
	      int total =rs2.getInt("cnt");
	      
	      
	      String sql = "select deptno,dname,loc from dept"
  		  		+" order by deptno asc";
	      ResultSet rs = stmt.executeQuery(sql);
	      
	      
	      System.out.println("[부서목록] 총:"+total+"개");
	      System.out.println("-----------------------");
	      
	      while(rs.next()) {
	    	  	String deptno = rs.getString("deptno");
	    	  	String dname = rs.getString("dname");
	    	  	String loc = rs.getString("loc");
	    	  	System.out.println(deptno + "," + dname + "," + loc);
	    }
	}
}	