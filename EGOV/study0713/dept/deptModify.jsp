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
<p>
부서정보 수정 화면
<form name="frm" method="post" action="deptModifySave.do">
<table border="1" width="400">
	<tr>
		<th>부서번호</th>
		<td><input type="text" name="deptno" value="${DeptVO.deptno}" readonly></td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td><input type="text" name="dname" value="${DeptVO.dname}"></td>
	</tr>
	<tr>
		<th>부서위치</th>
		<td><input type="text" name="loc" value="${DeptVO.loc}"></td>
	</tr>
</table>
<div>
	<button type="submit">저장</button>
	<button type="reset">취소</button>
</div>
</form>
</body>
</html>