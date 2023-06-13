<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Random,break</title>
</head>
<body>
<%
Random random = new Random();
out.print("0이상 n이하의 랜덤 정수값 :"+random.nextInt(10)+"<br>");
out.print("랜덤 boolean 값:"+random.nextBoolean()+"<br>");
out.print("랜덤 long 값:"+random.nextLong()+"<br>");
out.print("랜덤 float 값:"+random.nextFloat()+"<br>");
out.print("랜덤 double 값:"+random.nextDouble()+"<br>");
out.print("랜덤 정규 분포의 난수 값:"+random.nextGaussian());
%><br>

<%= Math.random()+10 %>

</body>
</html>