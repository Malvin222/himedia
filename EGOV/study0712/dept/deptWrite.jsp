<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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