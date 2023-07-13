<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="a" value="테스트"/>
<c:out value="${a} "/><br>
${a}<br>
<c:set var="eng" value="10"/>
<c:set var="kor" value="20"/>
result1 : ${eng+kor} , <br>
result2 : ${eng}+${kor} <br>
<c:set var="hap" value="${eng+kor}"/>
hap : ${hap}
<br>
<c:set var="str" value="javascript"/>
str : ${str}
<br>
len : ${fn:length(str)}
<br>
substring: ${fn:substring(str,4,10)}
<br>
<!-- test 조건이 맞으면 안에있는 내용 실행 -->
<c:if var="result" test="${str=='javascript'}">
	if result = ${result}
</c:if>
<br>
<c:forEach var="i" begin="1" end="10">
	${i}
</c:forEach>
<br>
<c:forEach var="i" begin="1" end="10" step="2">
	${i}
</c:forEach>

<p>
부서정보 입력 화면
<form name="frm" method="post" action="deptWriteSave.do">
<table border="1" width="400">
	<tr>
		<th>부서번호</th>
		<td><input type="text" name="deptno"></td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td><input type="text" name="dname"></td>
	</tr>
	<tr>
		<th>부서위치</th>
		<td><input type="text" name="loc"></td>
	</tr>
</table>
<div>
	<button type="submit">저장</button>
	<button type="reset">취소</button>
</div>
</form>
</body>
</html>