<%@page import="conn.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//쿠키변수 가져옴
Cookies cookies = new Cookies(request);
// String cookie_id = "test123"; String cookie_id= null;
String cookie_id = cookies.getValue("CookieUserId");
if(cookie_id ==null){
	cookie_id="";
}
%>
<!DOCTYPE html>
 <head>
  <meta charset="UTF-8">
  <title>로그인화면</title>
<link rel="stylesheet" href="../css/layout.css">
</head>
<script>
	fuction fn_submit(){
		
		if(document.frm.userid.value =="" ||
		   document.frm.userpw.value ==""	){
			alert("아이디 또는 암호를 확인해주세요.");
			document.frm.userid.focus();
			return false;
		}
		document.frm.submit();
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
		<%@include file="../include/navmenu.jsp" %>
		</div>
		<div class="nav_right_space">&nbsp;</div>
    </nav>
	<aside>
		<!-- aside S -->
		<%@ include file="../include/aside.jsp" %>
		<!-- aside E -->
	</aside>
    <section>
    <article>
    <!-- 본문 START  -->
<form name="frm" method="post" action="loginWriteSub.jsp">
   	<table style="width:400px;">
   		<tr>
   			<th>아이디</th>
   			<td><input type="text" name="userid" value="<%=cookie_id %>"></td>
		</tr>
   		<tr>
   			<th>암호</th>
   			<td><input type="password" name="userpw"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="checkbox" name="chk" value="1"
				<% if(!cookie_id.equals("")){out.print("checked"); } %>>
				
				아이디 기억하기
			</th>
		</tr>
   	</table>
   	<div style="width:400px;
   				text-align:center;
   				margin-top:10px;">
   		<button type="submit" onclick="fn_submit();return false;">로그인</button>
   		<button type="reset">취소</button>
   	</div>
</form>
    <!-- 본문 END  -->
     </article>
    </section>
    <footer>
	<!-- footer S -->
		<%@ include file="../include/footer.jsp" %>
	<!-- footer E -->
    </footer>
</div>
</body>
</html>

