package emp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class EmpSelectList extends DbConnect {
	public static void main(String[] args) throws Exception {
		
		//Connection().createStatement()로 객체 처리(메모리 작업 공간발생)-> 공간이 많이 필요한경우
		//작업공간에 stmt.executeQuery()메소드 를 담음
		Statement stmt = Connection().createStatement();

		//sql문 -> 전체 데이터 개수
		String sql1 ="select count(*) as total from emp";
		//sql (쿼리) 적용후 결과값을 rs1으로 받음  sql:Structured Query Language (구조적 쿼리 언어)
		
		ResultSet rs1 = stmt.executeQuery(sql1);
		int total=0;
		//next 메소드를 통해 결과 위치로 접근
		if( rs1.next() ) {
			//컬럼명을 통해 해당 요소에 접근
			total =rs1.getInt("total");
		}
		else {
			return;	//메소드 종료
		}
		
		String sql2 = "select empno "
						+ "	  ,ename"
						+ "   ,job"
						+ "   ,mgr"
						+ "   ,to_char(hiredate,'yyyy-mm-dd') hiredate"
						+ "   ,sal"
						+ "   ,comm"
						+ "   ,deptno "
						+ " from EMP "
						+"order by empno asc";
		ResultSet rs2 = stmt.executeQuery(sql2);
		
		System.out.println("[사원목록]");
		System.out.println("총 : "+total);
		System.out.println("-------------------------");
		int number = 0;
		while(rs2.next()){
			String empno =rs2.getString("empno");
			String ename=rs2.getString("ename");
			String job =rs2.getString("job");
			String mgr =rs2.getString("mgr");
			String hiredate =rs2.getString("hiredate");
			String sal =rs2.getString("sal");
			String comm =rs2.getString("comm");
			String deptno =rs2.getString("deptno");
			
			number ++;
			
			 System.out.println( number+empno+","+
					  			 ename+","+
					  			 job+","+
					  			 mgr+","+
					  			 hiredate+","+
					  			 sal+","+
					  			 comm+","+
					  			 deptno
					  			 );
		}
	}
}




/*		// DB접속 //	 javadatabaseconnection :// oracle,mysql
	String url = "jdbc:oracle:thin:@//localhost:1522/xe";
	String username ="C##java";
	String userpass ="1234";
	
	// 드라이버 ojdbc6.jar 연결//getConnection 메소드에 의해 DB 접속//
	Class.forName("oracle.jdbc.OracleDriver");
	//DB접속
	Connection con = DriverManager.getConnection(url,username,userpass);
	//접속 인스턴스(객체) 생성
	Statement stmt = con.createStatement();
*/	
//->	Statement stmt = Connection().createStatement(); //메소드화	
