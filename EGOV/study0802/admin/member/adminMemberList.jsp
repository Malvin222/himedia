<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원관리</title>
</head>

<style>
body { font-size:12px; font-family:맑은고딕; }
a { color:#0a0ccc; text-decoration:none; }
.topMenu_area {
	width:100%;
	height:70px;
	text-align:center;
	background:yellow;
}
.subMenu_area {
	width:100%;
	height:30px;
	text-align:center;
	background:skyblue;
	line-height:2.5;
	margin-bottom:30px;
}
.content_area {
	width:100%;
	text-align:center; 
}
.page_number_area {
	width:100%;
	text-align:center;
	padding-top:20px;
} 
.board1 {
	width:1000px;
	border-top:2px solid #474747;
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
}
.board1 th {
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
	padding:5px;
	height:30px;
}
.board1 td {
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
	padding:5px;
	text-align:center;
	height:20px;
}
</style>

<body>
	<%@include file="../../include/adminHeader.jsp" %>

<div class="content_area">

	<table border="0" width="1000" align="center">
		<tr>
			<td align="right">
				<form name="frm" method="post" action="/adminNoticeList.do?menu=1">
				<select	name="searchCondition">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="rdate">날짜</option>
				</select>
				<input type="text" name="searchKeyword">
				<button type="submit">검색</button>
				</form>
			</td>
		</tr>
	</table>


	<table border="0" width="1000" align="center">
		<tr>
			<td align="left">Total :${total } </td>
		</tr>
	</table>
	<table class="board1" align="center">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>등록날짜</th>
		</tr>
		<c:set var="rownumber" value="${vo.recordCountPerPage }"/>
		<c:forEach var="list" items="${list }" varStatus="status">
		<tr>
			<td>
				${rownumber}
			</td>
			<td style="text-align:left;">
			${list.userid }
			</td>
			<td>${list.name}</td>
			<td>${list.nickname}</td>
			<td>${list.rdate}</td>
		</tr>
		<c:set var="rownumber" value="${rownumber-1 }"/>
		</c:forEach>
	</table>
</div>
<div class="page_number_area">

	<c:forEach var="i" begin="1" end="${vo.lastPage}">
		<a href="/adminNoticeList.do?pageIndex=${i}">${i}</a>
	</c:forEach>

</div>


</body>
</html>




