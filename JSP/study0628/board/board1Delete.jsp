<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file="../../include/oracleCon.jsp" %>
<!-- 파라미터 -->
<% 
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
%>
<!-- null 값체크 -->
<!-- 삭제 SQL 작성 및 적용 -->
<%
String sql = "DELETE FROM board1 "
        + "WHERE unq = '" + unq + "' AND pass = '" + pass + "'";
Statement stmt = con.createStatement();

int result =stmt.executeUpdate(sql);
if(result ==1){
%>
	<script>
	alert("삭제완료");
	location="board1List.jsp";
	</script>
<%	
}else { 
%>
	<script>
	alert("암호를 다시 확인해주세요");
	history.back();
	</script>
<%	
}

%>