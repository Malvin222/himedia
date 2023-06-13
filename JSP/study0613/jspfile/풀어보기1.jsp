<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풀어보기</title>
</head>
<body>
<% 
String address = "123456 서울시 강남구 논현동77";
address = address.trim();
%>
<%= "문자열 길이:"+ address.length() +"<br>" %>
<%= "우편번호:"+address.substring(0,6) +"<br>" %>
<%= "주소:"+address.substring(6) +"<br>" %>
4.검색단어 "논현": <%=(address.indexOf("논현")>-1) ?"존재함":"존재안함" %>


<%--
	String equlas = "";
if (address.indexOf("논현")>0){
	
	equlas ="존재함";
}else {
	equlas ="존재하지 않음";
}
out.print("검색단어:\"논현\""+equlas);
 --%>
</body>
</html>