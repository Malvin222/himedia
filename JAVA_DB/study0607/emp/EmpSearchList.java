package emp;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class EmpSearchList extends DbConnect{
	
	public static void main(String[] args) throws Exception{
	System.out.println("[사원검색 프로그램]");
	System.out.println("1.사원명 검색 2.부서별 검색 3.업무별 검색 4.매니저별 검색 5.급여별 검색");
	System.out.println("번호>>");
	Scanner scn = new Scanner(System.in);
	int menu = scn.nextInt();
	//메뉴
	switch(menu) {
	case 1 : enameSearch();
	break;
	case 2 : dnameSearch();
	break;
	case 3 : jobSearch();
	break;
	case 4 : mgrnameSearch();
	break;
	case 5 : salSearch();
	break;
	}
	}
	
//메소드
	public static void enameSearch() throws Exception{
		
		Statement stmt =Connection().createStatement();
		Scanner scn = new Scanner(System.in);
		System.out.println("[1]사원명 검색");
		System.out.println("사원명>>");
		String ename = scn.next();

		String sql = "select empno,"
					 + "     job,"
					 + "     sal,"
					 + "     mgr,"
					 + "     (select ename from emp where empno=e.mgr) mgr_name,"
					 + "     deptno, "
					 + "     (select dname from dept where deptno = e.deptno) dname "
					 + "from emp e"
					 +" where e.ename=upper('"+ename+"')";
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("[사원정보]");
		
		int cnt = 0;
		while(rs.next()) {
			cnt++;
			String empno =rs.getString("empno");
			String job =rs.getString("job");
			String sal =rs.getString("sal");
			String mgr =rs.getString("mgr");
			String deptno =rs.getString("deptno");
			String mgr_name =rs.getString("mgr_name");
			String dname =rs.getString("dname");
			System.out.println("1.사원: "+empno+",\n"+
							   "2.업무: "+job+",\n"+
							   "3.급여: "+sal+",\n"+
							   "4.매니저번호: "+mgr+",\n"+
							   "5.부서번호: "+deptno+",\n"+
							   "6.매니저이름: "+mgr_name+",\n"+
							   "7.부서이름: "+dname
							   );
		}
		if(cnt==0) {
			System.out.println("***검색 결과가 없습니다.***");
		}
	}
	public static void dnameSearch() {
		
	}
	public static void jobSearch() {
		
	}
	public static void mgrnameSearch() {
		
	}
	public static void salSearch() {
		
	}
	
}