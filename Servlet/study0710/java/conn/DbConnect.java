package conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {
	
	public static Connection oracleCon() {
		Connection con = null;
		try {
		 String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		 String username ="C##java";
		 String userpass ="1234";
		 
		 Class.forName("oracle.jdbc.OracleDriver");
		 con = DriverManager.getConnection(url,username,userpass);
		} catch(Exception e) { 
			System.out.println("DB연결 실패!!");
		}
			return con;
	}
}
