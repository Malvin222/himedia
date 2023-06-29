<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String SessionUserId = (String)session.getAttribute("SessionUserId");
if(SessionUserId==null || SessionUserId.trim().equals("")){
%>
	<script>
		alert("로그인을 해주세요");
		location = "../member/loginWrite.jsp";
	</script>
<%
	return;
}
%>