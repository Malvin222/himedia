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

  String sql = "select deptno,dname,loc from dept order by deptno desc"; 
  ResultSet rs =stmt.executeQuery(sql);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function fn_delete(deptno){
		if(confirm("정말 삭제하시겠습니까?")){	//[예] [아니오]
			location="deptDelete.jsp?deptno="+deptno;
		}
		
	}
</script>

<body>

<div style="padding-bottom:10px;">
	<button type="button" onclick="location ='deptWrite.jsp'">부서등록</button>
</div>

<table border="1" width="600">
	<colgrop>
		<col width="15%"/>
		<col width="20%"/>
		<col width="35%"/>
		<col width="*%"/>
		<col width="8%"/>
	</colgrop>
	
	<tr>
		<th style="bgcolor='red';">순번</th>
		<th>부서번호</th>
		<th>부서이름</th>
		<th>부서위치</th>
		<th>삭제</th>
	</tr>
	<%
	int number=0;
	while (rs.next()){
		number++;
		String deptno =rs.getString("deptno");	
		String dname =rs.getString("dname");	
		String loc =rs.getString("loc");	
	%>
		<tr>
			<td><%=number %></td>
			<td><a href="deptModify.jsp?deptno=<%=deptno%>"><%=deptno %></a></td>
			<td><%=dname %></td>
			<td><%=loc %></td>
			<td><button type="button" onclick="fn_delete('<%=deptno%>')">삭제</button></td>
		</tr>
		
	<%
	} 
	%> 
</table>
<a href="deptWrite.jsp"><input type="button" value="글쓰기"></a>
</body>
</html>