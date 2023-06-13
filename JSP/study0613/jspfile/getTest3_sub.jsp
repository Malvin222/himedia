<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단독실행 불가</title>
</head>
<body>
<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String name	= request.getParameter("name");
String gender = request.getParameter("gender");
String gg ="";
if(gender.equals("M")){
	gg="남";
}else {
	gg="여";
}

%>
전송Id:<%=userid%><br>
전송Pw:<%=pass %><br>
전송Nm:<%=name %><br>
전송성별:<%=gg %>
</body>
</html>