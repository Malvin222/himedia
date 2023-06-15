<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file ="../../include/oracleCon.jsp"%>
<% 
   Statement stmt = con.createStatement();
%>

<!-- 파라메터 값 받기 설정 -->
	<% 
	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	String sal = request.getParameter("sal");
	String hiredate = request.getParameter("hiredate");
	String job = request.getParameter("job");
	String mgr = request.getParameter("mgr");
	String comm = request.getParameter("comm");
	String deptno = request.getParameter("deptno");
%>
	<!--  empno,ename의 널값&공백값 체크  -->
<% 
	if(empno == null || empno.equals("") ||
	   ename == null || ename.equals(""))
	   {
%>
	<script>
	alert("사원번호를 입력해주세요.");
	history.back()	//이전 페이지로 돌려보냄
	</script>
<%
	return; //jsp 종료
	}
%>
<!-- 사원번호 중복(SQL작성 후) 체크 -->
<%
	String sql1 = " select count(*) cnt from emp "
				+ " where empno= '"+empno+"' ";
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int cnt= rs1.getInt("cnt");
if (cnt > 0){
%>
	<script>
	alert("");
	history.back();
	</script>
<%	
	return;//jsp종료
} 
%>
<!-- 입력SQL 작성 및 적용 -->
<% 
String sql2 = "insert into emp(empno,ename,sal,hiredate,job,mgr,comm,deptno) "
			+" values ('"+empno+"','"+ename+"','"+sal+"','"+hiredate+"','"+job+"','"+mgr+"','"+comm+"','"+deptno+"')";
int result = stmt.executeUpdate(sql2) ;
%>
<!-- 저장완료 메세지 -->
<%
if(result == 1){
%>
	<script>
	alert("저장완료");
	location ="empList.jsp";
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