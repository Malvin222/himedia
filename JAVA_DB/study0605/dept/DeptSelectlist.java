package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DeptSelectlist {

   public static void main(String[] args) throws Exception {
      String url = "jdbc:oracle:thin:@//localhost:1522/xe";
      String username = "c##java";
      String userpass = "1234";
      
      Class.forName("oracle.jdbc.OracleDriver");
      Connection con = DriverManager.getConnection(url,username,userpass);
      Statement stmt = con.createStatement(); //데이터 베이스에서 로딩, 수정
      String sql = "select deptno,dname,loc from dept "
    		  		+"order by deptno asc";
      ResultSet rs = stmt.executeQuery(sql); //executeUpdate : 데이터 입력,업데이트,제거
      
      while(rs.next()) {
         String deptno = rs.getString("deptno");
         String dname = rs.getString("dname");
         String loc = rs.getString("loc");
         System.out.println(deptno + "," + dname+ "," +loc);
      }
   
   }

}