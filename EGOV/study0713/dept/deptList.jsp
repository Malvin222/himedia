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
<title>Insert title here</title>
</head>
<script>
function fn_delete(deptno){
	
	if(confirm('정말삭제?')){
		location ="deptDelete.do?deptno="+deptno;
	}
}
</script>

<body>
부서목록<p>
total : ${total}
<table border="1">
	<tr>
		<th>번호</th>
		<th>부서번호</th>
		<th>부서이름</th>
		<th>부서위치</th>
		<th>삭제</th>
	</tr>
	<c:forEach var="a" items="${resultList}" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td><a href="deptModify.do?deptno=${a.deptno}"><c:out value="${a.deptno}"/></a></td>
			<td><c:out value="${a.dname}"/></td>
			<td><c:out value="${a.loc}"/></td>
			<td><button type="button" onclick ="fn_delete('${a.deptno}')">삭제</button></td>
		</tr>
	</c:forEach>
</table>

<button type="button" onclick="location='/deptWrite.do'">부서입력</button>
</body>
</html>