<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include  file="../include/oracleCon.jsp" %>
<%@ include  file="../include/certify.jsp" %>
<%
String date =request.getParameter("date"); 
%>

<%
String sql_10= "select substr(title,1,20) as title, content ,view1 from sche_mgr "
		+" where to_char(sche_date,'yyyy-mm-dd')='"+date+"' and userid='"+SessionUserId+"' ";
Statement stmt =con.createStatement();
ResultSet rs = stmt.executeQuery(sql_10);

String title="";
String content="";
String view1="";
String gubun="I";
String title_message = "일정등록";
if(rs.next()){
	title = rs.getString("title");
	content = rs.getString("content");
	view1 = rs.getString("view1");
	gubun="U";
	title_message="일정변경";
}
%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>일정등록</title>
  
  <link rel="stylesheet" href="../css/layout.css">
</head>
<script>
function fn_delete(){
	if(confirm("일정을 삭제하시겠습니까?") ){
	//폼 action 값을 변경 후 폼 전송
	document.frm.action="planDelete.jsp";
	document.frm.submit();
	}
}
function fn_submit() {
   var f = document.frm;
   
   if( f.sche_date.value == "" )  {
      alert("날짜를 작성해주세요.");
      return false;
   }
   if( f.title.value == "" )  {
      alert("제목 입력해주세요.");
      return false;
   }
}
</script>
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
<input type="hidden" name="gubun" value="<%=gubun %>" >
	<caption><%=title_message %></caption>
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
				<input type="text" name="title" value="<%=title%>"><br>
			</td>
		</tr>
		<tr>
			<th>공개</th>
			<td>
				<input type="radio" name="view1" value="Y" <%if(!view1.equals("N") ) {out.print("checked");}  %>>보이기
				<input type="radio" name="view1" value="N" <%if(view1.equals("N")){out.print("checked");} %>>숨기기
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="content" style="width:98%;height:150px;"><%=content %></textarea>
			</td>
		</tr>
	</table>
	<div style="width:800px; text-align:center; margin-top:10px;">
	<button type="submit" onclick="fn_submit();return false;">저장</button>
	<button type="reset">취소</button>
	<%
	if(gubun.equals("U") ){
	%>
	<button type="button" onclick="fn_delete();">일정삭제</button>
    <%
	}
    %>
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