<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 수정</title>
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
<c:set var="code_gubun" value="${fn:substring(vo.cms_no,0,2) }"/>
<body>
<form name="frm" method="post" action="cmsModifySave.do">

<input type="hidden" name="cms_no" value="${vo.cms_no}">

<table border="1" width="400">
	<tr>
		<th>코드구별</th>
		<td>
		<select name="code_gubun" readonly>
			<option value="10" <c:if test="${code_gubun=='10'} ">selected</c:if>>스포츠</option>
			<option value="20" <c:if test="${code_gubun=='20'} ">selected</c:if>>과목</option>
			<option value="30" <c:if test="${code_gubun=='30'} ">selected</c:if>>취미</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>코드이름</th>
		<td><input type="text" name="cms_nm" value="${vo.cms_nm}"></td>
	</tr>
	<tr>
		<th>사용여부</th>
		<td>
		<input type="radio" name="cms_yn" value="Y" 
		<c:if test="${vo.cms_yn=='Y'}">
			checked
		</c:if>  >사용
		<input type="radio" name="cms_yn" value="N" 
		<c:if test="${vo.cms_yn=='N'}">
			checked
		</c:if>  >미사용
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