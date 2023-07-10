<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="conn.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Connection con =DbConnect.oracleCon();


String sql = " select code, "
			+" title, "
			+" to_char(sdate,'yyyy/mm/dd') sdate, "
			+" to_char(edate,'yyyy/mm/dd') edate, "
			+" decode(use,'Y','사용','미사용') use"
			+" from pollmain "
			+" where sdate <=sysdate "
			+" and edate >= sysdate "
			+" and use = 'Y' "
			+" order by code desc ";

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>
<html>
<head>
<meta charset="UTF-8">
<title>설문메인</title>
</head>
<script>
function fn_popup1(code) {
	var url = "pollEnter.jsp?code="+code;	
	window.open(url,"응모화면","width=600,height=300");
}
function fn_popup2(code) {
	var url = "pollResult.jsp?code="+code;	
	window.open(url,"결과화면","width=600,height=300");
}

</script>

<style>
body{
	font-size:12px;
	font-family:맑은고딕;
	line-height:2.0;
}
.table1 {
	width:400px;
	border:1px solid #ccc;
	border-collapse:collapse;
}
.table1 th,td{
	padding:5px;
	border:1px solid #ccc;
}
</style>
<body>
<table class="table1">
	<tr>
		<th colspan="3">설문</th>
	</tr>
	<% 
	int cnt =0;
	while(rs.next()) {
	String title =rs.getString("title");
	String code = rs.getString("code");
	cnt++;
	
	%>
	<tr align="center">
		<td width="10%"><%=cnt %></td>
		<td align="left"><%=title %></td>
		<td width="27%">
		<button type="button" onclick="fn_popup1('<%=code %>')">응모</button>
		<button type="button" onclick="fn_popup2('<%=code%>')">결과</button>		
		</td>
	</tr>
	<%
	}
	%>
</table>
</body>
</html>