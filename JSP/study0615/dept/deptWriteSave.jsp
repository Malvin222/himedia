<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 

   String url = "jdbc:oracle:thin:@//localhost:1521/xe";
   String username ="C##java";
   String userpass ="1234";
   // ojdbc6.jar(드라이버)
   Class.forName("oracle.jdbc.OracleDriver");
   Connection con = DriverManager.getConnection(url,username,userpass);
   Statement stmt = con.createStatement();
%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");

	if(deptno == null || deptno.equals("") ){
%>
	<script>
	alert("부서번호를 입력해주세요.");
	history.back()	//이전 페이지로 돌려보냄
	</script>
<%
	return; //jsp 종료
	}

	if(deptno == null || deptno.equals("") ){
%>
	<script>
	alert("부서이름을 입력해주세요");
	history.back(); //이전페이지로 돌려보냄
	</script>
<%
	return; //jsp 종료
	}
	
String sql = "insert into dept(deptno,dname,loc)"
			+" values('"+deptno+"','"+dname+"','"+loc+"')";
int result = stmt.executeUpdate(sql) ;
if(result == 1){
%>
	<script>
	alert("저장완료");
	location ="deptList.jsp";
	</script>
<%
} else{
	
%>	
	<script>
	alert("저장실패!!");
	history.back();
	</script>
<%
}
%>