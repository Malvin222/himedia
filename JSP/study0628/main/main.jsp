<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../include/oracleCon.jsp" %>
<%
String sql1 = "select a.* from ("
            + "   select unq"
            + "      ,substr(title,1,10) title "
            + "      ,name "
            + "      ,to_char(rdate,'yy-mm-dd') rdate "
            + "    from board1 "
	        + "   order by unq desc ) a "
            + " where rownum < 6";
Statement stmt1 = con.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);

String sql2 = "select a.* from ("
	        + "   select unq"
	        + "      ,substr(title,1,10) title "
	        + "      ,name "
	        + "      ,to_char(rdate,'yy-mm-dd') rdate "
	        + "    from reboard "
	        + "   where thread='a' "
	        + "   order by gid desc ) a "
	        + " where rownum < 6";
Statement stmt2 = con.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql2);
%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>layout2</title>
  
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
<div>
<!-- 일반게시판 최신 5개 영역 -->
	<table style="width:500px;">
		<caption>일반게시판</caption>
		<tr>
			<th width="15%">번호</th>
			<th>제목</th>
			<th width="20%">글쓴이</th>
			<th width="20%">등록일</th>
		</tr>
	<%
	int number1 = 0;
	while( rs1.next() ) {
		String unq   = rs1.getString("unq");
		String title = rs1.getString("title");
		String name  = rs1.getString("name");
		String rdate = rs1.getString("rdate");
		number1++;
	%>
		<tr>
			<td><%=number1 %></td>
			<td style="text-align:left;">
		<a href="../board/board1Detail.jsp?unq=<%=unq%>"><%=title %></a></td>
			<td><%=name %></td>
			<td><%=rdate %></td>
		</tr>
	<%
	}
	%>
	
	</table>
</div>

<div>
<!-- 답변게시판 최신 5개 영역(원글만) -->
	<table style="width:500px;">
		<caption>답변게시판</caption>
		<tr>
			<th width="15%">번호</th>
			<th>제목</th>
			<th width="20%">글쓴이</th>
			<th width="20%">등록일</th>
		</tr>
	<%
	int number2 = 0;
	while( rs2.next() ) {
		String unq   = rs2.getString("unq");
		String title = rs2.getString("title");
		String name  = rs2.getString("name");
		String rdate = rs2.getString("rdate");
		number2++;
	%>
		<tr>
			<td><%=number2 %></td>
			<td style="text-align:left;">
 <a href="../board/reBoardDetail.jsp?unq=<%=unq%>"><%=title %></a>
			</td>
			<td><%=name %></td>
			<td><%=rdate %></td>
		</tr>
	<%
	}
	%>
			
	</table>

</div>

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