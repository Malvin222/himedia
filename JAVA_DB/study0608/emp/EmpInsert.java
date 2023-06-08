package emp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

//-EmpInsert
//-사원번호 중복체크
//-모든 항목 사용자에게 받고 저장
public class EmpInsert extends DbConnect{
	public static void main(String[] args) throws Exception {
		  
		  //DB연결 및 접속인스턴스 생성
		  Statement stmt = Connection().createStatement(); //데이터 베이스에서 로딩, 수정
		  
	      Scanner scn = new Scanner(System.in);
	      System.out.println("[ 사원정보입력 ]");
	      System.out.println("1.사원번호>>");
	      String empno = scn.next();
	      
	      String sql1 ="select count(*) cnt from emp "
	      		  			+"where empno='"+empno+"'"; 
	      //sql 적용
	      ResultSet rs1 = stmt.executeQuery(sql1);
	      int cnt =0;
	      if( rs1.next() ) {
	    	  cnt = rs1.getInt("cnt");
	      }
	      else {	//sql 적용오류
	    	  return;	//메소드 종류
	      }
	      if(cnt>0) {
	    	  System.out.println("이미 사용중인 사원번호 입니다.");
	    	  return;
	      } 
	      
	      System.out.println("사원이름>>");
	      String ename = scn.next();
	     
	      System.out.println("업무>>");
	      String job = scn.next();
	      
	      System.out.println("매니저번호>>");
	      String mgr = scn.next();
	      
	      System.out.println("입사일(0000-00-00)>>");
	      String hiredate = scn.next();
	      
	      System.out.println("급여>>");
	      String sal = scn.next();
	      
	      System.out.println("커미션>>");
	      String comm = scn.next();
	      
	      System.out.println("부서번호>>");
	      String deptno = scn.next();
	      
	      
	      String sql2 ="insert into emp"+
	    		  		"(empno,ename,job,mgr,hiredate,sal,comm,deptno) "
	      	  		  	+"values ('"+empno+"','"+ename+"','"+job+"','"+mgr+"','"+hiredate+"','"+sal+"','"+comm+"','"+deptno+"')";
	      //sql 적용
	      int result = stmt.executeUpdate(sql2);
	      
	      if(result==1) {
	    	  System.out.println("저장완료");
	      }
	      else {
	    	  System.out.println("저장실패");
	      }
	}
}
