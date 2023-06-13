<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제어문</title>
</head>
<body>
<%
for (int i=1;i<=10;i++){
	out.print(i+" ");
}
%>
<br>
<%
for (int i=1;i<=10;i++){
%>

<%=i+" "%>&nbsp;&nbsp;

<%
}
%>
<br>
<table border="1">
 	<tr align = "center">
 	<%
 	for (int i=1;i<=10;i++){
 	%>
		<td width="30"><%=i %></td>
 	<%
 	} 
 	%>
 	</tr>
</table>
</body>
</html>