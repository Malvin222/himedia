<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frm" method ="post" action ="deptWriteSave.jsp">
<table border="1" width="400">
	<tr>
		<td>부서번호</td>
		<td><input type="text" name="deptno" width="200"></td>
	</tr>
	<tr>
		<td>부서이름</td>
		<td><input type="text" name="dname" width="200"></td>
	</tr>
	<tr>
		<td>부서위치</td>
		<td><input type="text" name="loc" width="200"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<button type="submit">저장</button>
		<button type="reset">취소</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>