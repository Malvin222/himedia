package comm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DbConnect {
	public static Connection Connection() throws Exception{
		// DB접속 //	 javadatabaseconnection :// oracle,mysql
				String url = "jdbc:oracle:thin:@//localhost:1521/xe";
				String username ="C##java";
				String userpass ="1234";
				
				// 드라이버 ojdbc6.jar 연결//getConnection 메소드에 의해 DB 접속//
				Class.forName("oracle.jdbc.OracleDriver");
				//DB접속
				Connection con = DriverManager.getConnection(url,username,userpass);
				//접속 인스턴스(객체) 생성 :작업공간을 배정 (작업공간이 많이 필요할경우 배제)
				//리턴타입 Statement
				//Statement stmt = con.createStatement();
				//return stmt;
				
				//많은 작업공간 할당이 필요할 경우 return con;  ->리턴타입 Connection
				return con;
	}
	
	public static Connection mysqlConnect() throws Exception{
		//jdbc->자바데이터베이스 커넥트프로그램, /localhost:3306->위치정보/apple1004->데이터베이스명 , 인코딩 설정
	String url="jdbc:mysql://localhost:3306/apple1004?useUnicode=true&characterEncoding=utf8";
      String username="test1004";
      String userpass="123456";
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection(url,username,userpass);
       return con;
   }

}
