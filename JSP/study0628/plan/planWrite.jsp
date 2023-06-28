<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String date =request.getParameter("date"); 
%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>일정등록</title>
  
  <link rel="stylesheet" href="../css/layout.css">
</head>

<body>
<div class="wrap">
    <header>
		<div class="top_header">

		</div>
    </header>
    <nav>
	 	<div class="nav_left_space">&nbsp;</div>
		<div class="nav_center_space"> 
	
	<!-- nav menu S -->
		<%@ include file="../include/navmenu.jsp" %>
	<!-- nav menu E -->
		
		</div>
		<div class="nav_right_space">&nbsp;</div>
    </nav>
	<aside>
	<!-- aside area S -->
		<%@ include file="../../include/aside.jsp" %>
	<!-- aside area E -->
	</aside>
    <section>
       <article>
	<!-- 본문 S -->
<form name="frm" method="post" action="planWriteSave.jsp">
	<table style="width:600px;">
		<tr>
			<th>날짜</th>
			<td>
				<input type="date" name="date" value="<%=date%>" readonly >
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="title"><br>
			</td>
		</tr>
		<tr>
			<th>공개</th>
			<td>
				<input type="radio" name="view1" value="Y">보이기
				<input type="radio" name="view1" value="N">숨기기
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="content" style="width:98%;height:150px;"></textarea>
			</td>
		</tr>
	</table>
	<div style="width:800px; text-align:center; margin-top:10px;">
	<button type="submit">저장</button>
	<button type="reset">취소</button>
    </div>
</form>
    <!-- 본문 E -->
       </article>
    </section>
    <footer>
	<!-- footer area S -->
		<%@ include file="../../include/footer.jsp" %>
	<!-- footer area E -->
    </footer>
</div>
</body>
</html>