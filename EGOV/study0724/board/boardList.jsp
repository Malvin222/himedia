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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<script>
function fn_page(pageIndex) {
	
	$("#pageIndex").val(pageIndex);
	$("#searchFrm").submit();
	//document.searchFrm.pageIndex.value = indexPage;
	//document.searchFrm.submit();
}
</script>

<body>

[ 게시판 목록 ] 

<p>
	Total : ${total }
</p>
<p>
	<form id="searchFrm" method="post" action="/boardList.do">
		<input type="hidden" name="pageIndex" id="pageIndex" value="1">
		<select name="searchCondition">
			<option value="title" 
				<c:if test="${defaultVO.searchCondition=='title' }">selected</c:if> >제목</option>
			<option value="content"
			    <c:if test="${defaultVO.searchCondition=='content' }">selected</c:if> >내용</option>
			<option value="name"
			    <c:if test="${defaultVO.searchCondition=='name' }">selected</c:if> >이름</option>
		</select>
		<input type="text" name="searchKeyword" value="${defaultVO.searchKeyword }">
		<button type="submit">검색</button>
	</form>
</p>
<table border="1" width="600" cellpadding="5">

	<tr>
		<th width="10%">번호</th>
		<th width="*">제목</th>
		<th width="15%">글쓴이</th>
		<th width="17%">등록일</th>
		<th width="10%">조회수</th>
	</tr>
	
	<c:set var="rownumber" value="${defaultVO.recordCountPerPage }"/>

	<c:forEach var="list" items="${resultList}" varStatus="status">
	<tr align="center">
		<td>${rownumber }</td>
		<td align="left"><a href="boardDetail.do?unq=${list.unq }">${list.title }</a></td>
		<td>${list.name }</td>
		<td>${list.rdate }</td>
		<td>${list.hits }</td>
	</tr>
	<c:set var="rownumber" value="${rownumber-1 }"/>
	</c:forEach>
</table>
<div>
    <c:forEach var="i" begin="1" end="${defaultVO.lastPage }">
    	<a href="javascript:fn_page('${i }')">${i }</a>  
    </c:forEach>
</div>


</body>
</html>






