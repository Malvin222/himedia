<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file ="../../include/oracleCon.jsp" %>
<% 
   Statement stmt = con.createStatement();
%>
<% request.setCharacterEncoding("utf-8"); %>
	
<%
	String empno    = request.getParameter("empno");
	String ename    = request.getParameter("ename");
	String job 	    = request.getParameter("job");
	String mgr      = request.getParameter("mgr");
	String sal      = request.getParameter("sal");
	String comm     = request.getParameter("comm");
	String deptno   = request.getParameter("deptno");
	String hiredate = request.getParameter("hiredate");	

	
	if( empno == null || empno.equals("") ){
%>
	<script>
	alert("잘못된 경로로의 접근입니다.");
	history.back();
	</script>
<%
return;
}
 %>
 <!-- 입력SQL 작성 및 적용 -->
 <% 
	String sql = "update emp set ename='"+ename+"'"
				+",job='"+job+"'"
				+",mgr='"+mgr+"'"
				+",sal='"+sal+"'"
				+",comm='"+comm+"'"
				+",deptno='"+deptno+"'"
				+",hiredate='"+hiredate+"'" 
				+ "where empno='"+empno+"' ";
	int result = stmt.executeUpdate(sql);
	if (result == 1){
	%>	
	<script>
	alert("변경완료");
	location='empList.jsp';
	</script>
<%
} else{
%>
	<script>
	alert("변경실패");
	history.back;
	</script>
<%
}
%>


