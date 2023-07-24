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
<title>공지사항관리</title>
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

<div class="topMenu_area">
	<div style="height:30px;">&nbsp;</div>
	<div>
		<a href="/adminNoticeList.do?menu=1">공지관리</a> |  
		<a href="/adminMemberList.do?menu=2">회원관리</a> |
		<a href="/adminGoodsList.do?menu=3">상품관리</a> | 
		<a href="/adminReserveList.do?menu=4">예약관리</a>
	</div>
</div>
<div class="subMenu_area">
	<a href="/adminNoticeWrite.do?menu=1">공지등록</a> 
	<a href="/adminNoticeList.do?menu=1">공지목록</a>
	<a href="/adminMemberWrite.do?menu=2">회원등록</a> 
	<a href="/adminMemberList.do?menu=2">회원목록</a>
	<a href="/adminGoodsWrite.do?menu=3">상품등록</a>
	<a href="/adminGoodsList.do?menu=3">상품목록</a>
</div>
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
			<td align="left">Total : ${total}</td>
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
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
			<th>조회</th>
		</tr>
		<c:set var="rownumber" value="${vo.recordCountPerPage }"/>
		<c:forEach var="list" items="${resultList }" varStatus="status">
		<tr>
			<td>
				<c:if test="${list.emps=='Y'}">공지</c:if>
				<c:if test="${list.emps=='N'}">${rownumber}</c:if>
			</td>
			<td style="text-align:center;"><a href="adminNoticeDetail.do?unq=${list.unq}">${list.title }</a></td>
			<td>${list.name}</td>
			<td>${list.rdate}</td>
			<td>${list.hits}</td>
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




