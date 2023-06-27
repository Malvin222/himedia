<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String SessionUserId =(String)session.getAttribute("SessionUserId");
%>
<body>
<ul>
	<li class="menuLink"><a href="../main/main.jsp">홈</a></li>
	<li class="menuLink"><a href="#">일정관리</a></li>
	<li class="menuLink"><a href="../board/board1List3_page.jsp">게시판</a></li>
	<li class="menuLink"><a href="../reBoard/reBoardList.jsp">답변게시판</a></li>
<%
if(SessionUserId ==null){ // 로그인 이전
%>
	<li class="menuLink"><a href="../member/memberWrite.jsp">회원가입</a></li>
	<li class="menuLink"><a href="../member/loginWrite.jsp">로그인</a></li>
<%	
}else{ //로그인 이후
%>
	<li class="menuLink"><a href="../member/memberModify.jsp">회원정보수정</a></li>
	<li class="menuLink"><a href="../member/loginOut.jsp">로그아웃</a></li>
<%
}
%>
	
	
	<li class="menuLink"><a href="../post/postList.jsp">우편번호검색</a></li>
</ul>
</body>
</html>