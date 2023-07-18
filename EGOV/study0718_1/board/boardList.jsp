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
<title>게시판 목록</title>
</head>
<body>
[ 게시판 목록 ]
<p>
	Total : ${total}
</p>
<table border="1" width="600">
	<tr>
		<th width="10%">번호</th>
		<th width="*">제목</th>
		<th width="15%">글쓴이</th>
		<th width="15%">등록일</th>
		<th width="15%">조회수</th>
	</tr>
	<c:forEach var="List" items="${resultList}" varStatus="status">
	<tr>
		<td>${status.count }</td>
		<td>${List.title }</td>
		<td>${List.name }</td>
		<td>${List.rdate}</td>
		<td>${List.hits }</td>
	</tr>
	</c:forEach>
</table>
<div>
	<c:forEach var="i" begin="1" end="${defaultVO.lastPage }">
		<a href="/boardList.do?pageIndex=${i }">${i}</a>
	</c:forEach>
</div>
</body>
</html>