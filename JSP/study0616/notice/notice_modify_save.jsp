<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../include/oracleCon.jsp" %>
<% 
   Statement stmt = con.createStatement();
%>
<% request.setCharacterEncoding("utf-8"); %>
	
<%
	String unq = request.getParameter("unq");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	if( unq == null || unq.equals("") ){
%>
	<script>
	alert("잘못된 경로로의 접근입니다.");
	history.back();
	</script>
<%
return;
}
 %>
 
 <% 
	String sql = "update notice set title='"+title+"',content='"+content+"' where unq='"+unq+"' ";
	int result = stmt.executeUpdate(sql);
	if (result == 1){
	%>	
	<script>
	alert("변경완료");
	location='notice_list.jsp';
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

