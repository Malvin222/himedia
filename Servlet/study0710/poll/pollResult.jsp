<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="conn.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
Connection con =DbConnect.oracleCon();
String code = request.getParameter("code");
String sql= " select title from pollmain "
			+" where code='"+code+"'";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
rs.next();
String title = rs.getString("title");

String sql2 = " Select code,item,vote,(sum(vote) over()) total from pollsub "
			+ " where code like '"+code+"%'";
Statement stmt2 = con.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql2);
%>
<html>
<head>
<meta charset="UTF-8">
<title>설문 메인</title>
</head>
<script>
function fn_submit(){
	//투표항목 체크여부(라디오상자)
	if(document.frm.subCode.value ==""){
		alert("항목을 체크해주세요.");
		return false;
	}
	//전송
	document.frm.submit();
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
button {
	font-size
}
</style>
<body>
<form name="frm" method="post" action="/project_sv/voteSave">
	<table class="table1">
		<tr>
			<th colspan="3">
				<%=title %>
			</th>
		</tr>
		<%
		int cnt =0;
		while(rs2.next()){
			cnt++;
			String subCode	= 	rs2.getString("code");
			String item 	= 	rs2.getString("item");
			int vote 		= 	rs2.getInt("vote");
			int total 		=  	rs2.getInt("total");
			//(vote *100) / total --> 반올림(43.555) ->44
			int ratio = (int)Math.round( (vote *100.0)/total );
		%>	
		<tr align="left">
			<td width="200" <%if(cnt%2==0){ %>  bgcolor="skyblue"<%} %>>
			   <%=item %>
			</td>
			<td width="50">
			(<%=ratio%>%)
			</td>
			<td width="300">
				<div style="width:<%=ratio%>%; height:10px; background:red;">&nbsp;</div>
			</td>
		</tr>
		<%
		}
		%>
	</table>
<div style="margin-top:10px ">
	<button type="submit" onclick="fn_submit">투표하기</button>
</div>
</body>
</form>
</html>