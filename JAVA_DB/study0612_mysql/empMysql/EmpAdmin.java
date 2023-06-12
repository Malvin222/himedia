package empMysql;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;
import comm.DbConnect;

public class EmpAdmin extends DbConnect{
	public static void main(String[] args) throws Exception {
		System.out.println("1.기본입출력");
		System.out.println("2.부서별출력");
		System.out.println("3.페이지별출력");
		Scanner scn = new Scanner(System.in);
		System.out.println("번호입력>>");
		int number =scn.nextInt();
		
		switch(number) {
		case 1:
			empDml();
			break;
		case 2:
			break;
		case 3:
			break;
	}
}

	public static void empDml() throws Exception{
		System.out.println("------------");
		System.out.println("1.기본 출력");
		System.out.println("2.입력 화면");
		System.out.println("3.수정 화면");
		System.out.println("4.삭제");
		
		Scanner scn =new Scanner(System.in);
		
		int number = scn.nextInt();
		
		switch(number) {
		case 1:
				empSelectList();
			break;
		case 2: 
			empInsert();
			break;
		case 3:
			empUpdate();
			break;
		case 4:
			 empDelete();
			break;
		}
		
	}
	
	public static void empSelectList() throws Exception{
					
					//mysqlConnect() 데이터 베이스 연동 +작업공간 확보(객체화)
    System.out.println("---------");
    Statement stmt = mysqlConnect().createStatement();
    String sql = "SELECT empno as empno"
                     + "    ,rpad(ename,8,' ') as ename"
                     + "    ,rpad(sal,4,' ') as sal"
                     + "    ,deptno as deptno"
                     + " FROM emp";
     ResultSet rs = stmt.executeQuery(sql);
     int rownum = 0;
     while( rs.next() ) {
          rownum++;
          String empno = rs.getString("empno");
          String ename = rs.getString("ename");
          String sal = rs.getString("sal");
          String deptno = rs.getString("deptno");
          if(rownum < 10) System.out.print(' ');
          System.out.println( rownum+") "+empno+","+ename+","+sal+","+deptno );
     }
}	
	
	public static void empInsert() throws Exception {


    System.out.println("---------");

    Statement stmt = mysqlConnect().createStatement();
    String sql = "select max(empno)+1 as empno from emp";
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
    String empno = rs.getString("empno");
    System.out.println("사원번호>>"+empno);

    Scanner scn = new Scanner(System.in);
    System.out.print("사원명>>");
    String ename = scn.next();
    System.out.print("업무(JOB)>>");
    String job = scn.next();
    System.out.print("사수(MGR)>>");
    String mgr = scn.next();
    System.out.print("입사일(년-월-일)>>");
    String hiredate = scn.next();
    System.out.print("급여>>");
    String sal = scn.next();
    System.out.print("커미션>>");
    String comm = scn.next();
    System.out.print("부서번호>>");
    String deptno = scn.next();

    String sql2 = "insert into emp "
                       + " values('"+empno+"'"
                       + ",'"+ename+"'"
                       + ",'"+job+"'"
                       + ",'"+mgr+"'"
                       + ",'"+hiredate+"'"
                       + ",'"+sal+"'"
                       + ",'"+comm+"'"
                       + ",'"+deptno+"')";
   int result = stmt.executeUpdate(sql2);
   if(result > 0) {
            System.out.println("*** 입력완료 ***");
   }
	
}
	
	public static void empUpdate() throws Exception {
    System.out.println("---------");
    Statement stmt = mysqlConnect().createStatement();
    Scanner scn = new Scanner(System.in);
    System.out.print("사원번호>>");
    String empno = scn.next();
    String sql = " select sal,hiredate from emp "
                    + "  where empno='"+empno+"' ";
    ResultSet rs = stmt.executeQuery(sql);
    int sal = 0;
    String hiredate = "";
    if(rs.next()) {
          sal = rs.getInt("sal");
          hiredate = rs.getString("hiredate");
    } else {
          System.out.println("없는 사원번호입니다.");
          return;	//메소드종료
    }
    System.out.println("(현)급여 "+sal+" :: (현)입사일 "+hiredate);
    System.out.print("새로운 급여(종료:숫자이외값)>>");
    String n_sal = scn.next();
    boolean chk_sal = n_sal.matches("[0-9]*");
    if(chk_sal==false) {
           System.out.println("입력값은 "+n_sal+"으로 종료합니다.");
           return;
    }
   System.out.print("새로운 입사일(종료:날짜형식이아닌경우)>>");
   String n_hiredate = scn.next();
   
   //정규표현식						matches (숫자가 1개이상)
   boolean chk_hiredate = n_hiredate.matches ("[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}");
   if(chk_hiredate == false) {
              System.out.println("입력값은 "+n_hiredate+"으로 종료합니다.");
              return;
   
   }
   String sql2 = "UPDATE emp SET "
                                   + "  sal='"+n_sal+"'"
                                   + " ,hiredate='"+n_hiredate+"' "
                      + " WHERE empno='"+empno+"' ";
   int result = stmt.executeUpdate(sql2);
   if(result == 1) {
          System.out.println("*** 변경완료 ***");
   } else {
          System.out.println("*** 변경실패 ***");
   }
}
	
	public static void empDelete() throws Exception {
    System.out.println("---------");
    Statement stmt = mysqlConnect().createStatement();
    Scanner scn = new Scanner(System.in);
    System.out.print("사원번호(삭제)>>");
    String empno = scn.next();
     String sql = " select count(*) cnt from emp "
                      + "  where empno='"+empno+"' ";
     ResultSet rs = stmt.executeQuery(sql);
     rs.next();
     int cnt = rs.getInt("cnt");
     if(cnt == 0) {
                System.out.println(empno+"는 없는 사원번호입니다. 종료합니다.");
                return;
     }
     System.out.println(empno+"는 존재하는 사원입니다.");
     System.out.print("삭제를 원하면 1번, 아니면 그외를 입력하세요.>>");
     try {
              int number = scn.nextInt();
              if(number==1) {
                    System.out.println("*** 사원정보를 삭제합니다. ***");
                    String delSql = " delete from emp "
                                               + " where empno='"+empno+"'";
                     stmt.executeUpdate(delSql);
                     System.out.println("*** 삭제완료 ***");
             } else {
                    System.out.println("1번을 입력하지 않았습니다. 종료합니다.");
                    return;
            }
      } catch (Exception e) {
            System.out.println("숫자이외를 입력하셨습니다. 종료합니다.");
            return;
     }
}
}
	
	

