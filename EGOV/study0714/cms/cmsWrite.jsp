<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 등록</title>
</head>
<script>
function fn_submit(){
	if(document.frm.cms_nm.value == ""){
		alert("코드이름을 입력해주세요");
		document.frm.cms_nm.focus();
		return false;
	}
	document.frm.submit();
}
</script>
<body>
<form name="frm" method="post" action="cmsWriteSave.do">
<table border="1" width="400">
	<tr>
		<th>코드구별</th>
		<td>
		<select name="code_gubun">
			<option value="10">스포츠</option>
			<option value="20">과목</option>
			<option value="30">취미</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>코드이름</th>
		<td><input type="text" name="cms_nm"></td>
	</tr>
	<tr>
		<th>사용여부</th>
		<td>
		<input type="radio" name="cms_yn" value="Y" checked>사용
		<input type="radio" name="cms_yn" value="N" >미사용
		</td>
	</tr>
</table>
<div>
<button type="submit" onclick="fn_submit(); return false">등록</button>
<button type="reset">취소</button>
</div>
</form>
</body>
</html>