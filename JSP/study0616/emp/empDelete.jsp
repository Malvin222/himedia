<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- @@@@@ include file 주소 확인@@@@@ -->
<%@ include file ="../../include/oracleCon.jsp" %>
<% 
   Statement stmt = con.createStatement();
%>
<% request.setCharacterEncoding("utf-8"); %>
	
<%
String empno = request.getParameter("empno");


	//null 값체크와 "" 체크의 순서가 바뀌면 에러뜸
	//empDelete.jsp ;; empno = null; //empDelete.jsp?empno = 
	if( empno == null || empno.equals("") ){
%>
	<script>
	alert("잘못된 경로로의 접근입니다.");
	history.back();
	</script>
<%
return;	//jsp종료
}
 %>

 <% 
	String sql = "delete from emp where empno='"+empno+"'";
	int result = stmt.executeUpdate(sql);
	if (result == 1){
%>	
	<script>
	alert("삭제완료");
	location="empList.jsp";
	</script>
<%
} else{
%>
	<script>
	alert("삭제실패");
	history.back();
	</script>
<%
}
%>

