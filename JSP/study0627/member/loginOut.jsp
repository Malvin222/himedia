<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 세션 삭제 -->
<%
session.removeAttribute("SessionUserId");
%>
<Script>
	alert("로그아웃되었습니다.");
	location="../main/main.jsp";
</Script>