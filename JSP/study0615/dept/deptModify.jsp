<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
<%
String deptno = request.getParameter("deptno");
String sql = "select dname,loc from dept where deptno='"+deptno+"' "; 
ResultSet rs =stmt.executeQuery(sql);
rs.next();
String dname = rs.getString("dname");
String loc = rs.getString("loc");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frm" method ="post" action ="deptModifySave.jsp">
<table border="1" width="400">
	<tr>
		<td>부서번호</td>
		<td><input type="text" name="deptno" value="<%=deptno %>" readonly></td>
	</tr>
	<tr>
		<td>부서이름</td>
		<td><input type="text" name="dname" value="<%=deptno %>"></td>
	</tr>
	<tr>
		<td>부서위치</td>
		<td><input type="text" name="loc" value="<%=deptno %>"></td>
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