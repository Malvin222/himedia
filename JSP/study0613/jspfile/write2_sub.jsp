<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String username = request.getParameter("username");
String birthday = request.getParameter("birthday");
String phone = request.getParameter("phone");
String addr = request.getParameter("addr");
String gender = request.getParameter("gender");

String [] hobby =request.getParameterValues("hobby");
%>
(1)이름: <%=username %><br>
(2)생년월일: <%=birthday %><br>
(3)연락처: <%=phone %><br>
(4)거주지: <%=addr %><br>
(5)성별: <%=gender %><br>
(6)취미: <%
//String[] hobby ={"바둑","장기","체스"}
//String[] hobby ={"바둑","장기"}
//String[] hobby ={"바둑"}
//String[] hobby ={}
if( hobby == null ){
	out.print("취미:선택없음");
}else {
	
	for(int i=0;i<hobby.length;i++){
		out.print(hobby[i]+" ");
	}
}
%>
<input type="button" value="뒤로가기" onclick="history.back()"> 
</body>
</html>