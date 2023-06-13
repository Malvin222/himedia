<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String birthday ="20100115 20011225 19981102";
Calendar cal =  Calendar.getInstance();
int yy =cal.get(Calendar.YEAR);
String[] birthdays = birthday.split(" ");		
%>
전송데이터 : <%=birthday %><br>
<%
for (int i=0; i<birthdays.length;i++){
	String y = birthdays[i].substring(0,4);
	String m = birthdays[i].substring(4,6);
	String d = birthdays[i].substring(6);
	int age = yy - Integer.parseInt(y);
%>
	데이터 <%= i+1 %> : 나이(만 <%=age %>), 생일(<%=m %>월<%=d %>일)<br>
<%
}
%>







<%--
String birthday = "20100115 20011225 19981102";
String[] bd = birthday.split(" ");
out.print("전송 데이터: "+birthday+"<br>");
out.print("데이터 1: 나이 (만"+(2023-Integer.parseInt(bd[0].substring(0,4)))+"),생일("+bd[0].substring(5,6)+"월"+bd[0].substring(6)+"일)<br>");
out.print("데이터 2: 나이 (만"+(2023-Integer.parseInt(bd[1].substring(0,4)))+"),생일("+bd[0].substring(5,6)+"월"+bd[0].substring(6)+"일)<br>");
out.print("데이터 3: 나이 (만"+(2023-Integer.parseInt(bd[2].substring(0,4)))+"),생일("+bd[0].substring(5,6)+"월"+bd[0].substring(6)+"일)<br>");
--%>
</body>
</html>