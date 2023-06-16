<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../include/oracleCon.jsp" %>
<% 
   Statement stmt = con.createStatement();
%>
<%
String unq = request.getParameter("unq");
String sql = "select unq,title,content,hits,rdate from notice where unq='"+unq+"' "; 
ResultSet rs =stmt.executeQuery(sql);
rs.next();
String title = rs.getString("title");
String content = rs.getString("content");
%>
<%
String sql2 ="update notice set hits=hits+1 where unq ='"+unq+"'";
stmt.executeUpdate(sql2);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>

<body>

<form name="frm" method ="post" action ="notice_modify_save.jsp">
<input type = "hidden" name="unq" value="<%=unq %>" readonly>
<table border="1" width="280">

	<tr>
		<td >제목</td>
		<td ><input type="text" name="title" size="28"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" cols="30" rows="13"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<button type="submit">저장</button>
		<button type="reset">취소</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>