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
String sql = "select unq,title,content,hits,rdate from notice order by unq desc ";
ResultSet rs =stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
<script>
	function fn_delete(unq){
		
		if(confirm("정말 삭제하시겠습니까?")){	//[예] [아니오]
			location="notice_delete.jsp?unq="+unq;
		}
		
	}
</script>
<body>

<div style="margin-bottom:5px;">

<form name="frm" method="post" action="notice_list.jsp">


<button type="button" onclick = "location='notice_write.jsp'">글쓰기</button>
<table>
	<colgroup>
		<col width="10%"/>
		<col width="15%"/>
		<col width="*%"/>
		<col width="10%"/>
		<col width="25%"/>
		<col width="10%"/>
	</colgroup>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>조회수</th>
		<th>등록일</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<%
	while(rs.next()){
		String unq = rs.getString("unq");
		String title = rs.getString("title");
		String content = rs.getString("content");
		String hits = rs.getString("hits");
		String rdate = rs.getString("rdate");
	%>
	<tr>
		<td><%=unq %></a></td>
		<td><%=title %></td>
		<td><%=content %></td>
		<td><%=hits %></td>
		<td><%=rdate %></td>
		<td><a href ="notice_modify.jsp?unq=<%=unq%>"><button type="button" onclick="">수정</button></a></td>
		<td><button type="button" onclick="fn_delete('<%=unq%>')">삭제</button></td>
	</tr>

<% 	
}
%>
	
</table>
</form>
</div>
</body>
</html>