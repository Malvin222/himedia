<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성</title>
</head>
<style>
input {
margin:auto;
}
</style>
<body>
<form name="frm" method ="post" action ="notice_write_save.jsp">
<table border="1" width="290">

	<tr>
		<td >제목</td>
		<td ><input type="text" name="title" size="28"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" cols="30" rows="13" align="center"></textarea></td>
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