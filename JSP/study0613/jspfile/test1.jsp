<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
자바스크립트<br>
 <%
 String title ="JSP";
 int year =2023;
 out.print(title+"<br>");
 out.print(year);
 %>
 <%= title %><br>
 <%= year %>
 
 
</body>
</html>