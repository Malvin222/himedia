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
 request.setCharacterEncoding("utf-8");
%>
<%
String colname = request.getParameter("colname");
String searchtxt = request.getParameter("searchtxt");

String str="";
if ( colname != null    && 
	 !colname.equals("")&& 
	 searchtxt !=null   &&
	 !searchtxt.equals("") )
{	
	//str = "AND ename ='홍길동'";
	str=" AND "+colname+"='"+searchtxt+"'";
}
%>


<%
//번호,사원번호,사원이름,부서이름,입사일
String sql = "select e.empno as empno "
			 +" ,e.ename as ename "
			 +" ,d.dname as dname "
			 +" ,to_char(e.hiredate,'yyyy-mm-dd') as hiredate "
			 +" from emp e, dept d "
			 +" where e.deptno  = d.deptno(+) " 
			 +  str
			 +" order by hiredate asc ";
ResultSet rs =stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>
</head>

<style>
body{
	font-size:12px;
	color:#111111;
	font-family:맑은고딕;
}
table{
	width:600px;
	border:1px solid #ccc;
	border-collapse:collapse;
}
th, td{
	border:1px solid #ccc;
	padding: 5;
	text-align:center;
}
</style>
<body>

<div style="margin-bottom:5px;">

<form name="frm" method="post" action="empList.jsp">
<select name = "colname">
	<option value="">-검색-</option>
	<option value="empno">사원번호</option>
	<option value="enmae">사원이름</option>
	<option value="dname">부서이름</option>
	<option value="hiredate">입사일</option>
</select>
<input type="text" name="searchtxt">
<button type="submit">검색</button>
<button type="button" onclick = "location='empWrite.jsp'">사원등록</button>

</form>

</div>
<table>
	<colgroup>
		<col width="10%"/>
		<col width="15%"/>
		<col width="15%"/>
		<col width="25%"/>
		<col width="25%"/>
		<col width="10%"/>
	</colgroup>
	<tr>
		<th>번호</th>
		<th>사원번호</th>
		<th>사원이름</th>
		<th>부서이름</th>
		<th>입사일</th>
		<th>삭제</th>
	</tr>
	<%
	int number=0;
	while(rs.next()){
		number++;
		String empno = rs.getString("empno");
		String ename = rs.getString("ename");
		String dname = rs.getString("dname");
		String hiredate = rs.getString("hiredate");
	%>
	<tr>
		<td><%=number %></td>
		<td><a href ="empModify.jsp?empno=<%=empno%>"><%=empno %></a></td>
		<td><%=ename %></td>
		<td><%=dname %></td>
		<td><%=hiredate %></td>
		<td><button type="button">삭제</button></td>
	</tr>

<% 	
}
%>
	
</table>

</body>
</html>