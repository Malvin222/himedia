
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file ="../../include/oracleCon.jsp" %>
<!-- 파라메터 값 세팅 -->
<%
	String unq = request.getParameter("unq");
%>
<!-- 상세보기 SQL 작성 및 적용 -->	
<%
	Statement stmt = con.createStatement();
			String sql1 = "select unq,name,title,content,rdate,pass "
				   +"	from reBoard "
				   +" where unq='"+unq+"'";
	ResultSet rs1 = stmt.executeQuery(sql1);
	
	rs1.next();
	String title = rs1.getString("title");
	String name = rs1.getString("name");
	String pass = rs1.getString("pass");
	String content = rs1.getString("content");
	String rdate = rs1.getString("rdate");
%>
<!-- unq null 체크  -->
<%
	if(unq == null ||unq.equals("")){
%>
	<script>
	alert("잘못된 접근입니다.");
	location = "reBoardList.jsp";
	</script>
<%	
	return;
	}
%>
 <head>
  <meta charset="UTF-8">
  <title>답변형게시판 수정화면</title>
<link rel="stylesheet" href="../css/layout.css">
</head>
<Script>
function fn_submit(){
	var f = document.frm;
	if(f.title.value =="") {
		alert("제목을 입력해주세요");
		f.title.focus();
		return false;	//종료
	}
	if(f.pass.value ==""){
		alert("암호를 입력해주세요");
		f.pass.focus();
		return false;	//종료
	}
	f.submit();  //전송
}


</Script>
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
		<%@include file="../include/navmenu.jsp" %>
		<!-- nav menu E -->
		</div>
		<div class="nav_right_space">&nbsp;</div>
    </nav>
	<aside>
	<!-- aside S -->
		<%@ include file="../../include/aside.jsp" %>
	<!-- aside E -->
	</aside>
    <section>
       <article>
		<!-- 본문 START -->
	<form name="frm" method="post" action="reBoardModifySave.jsp">

<input type="hidden" name="unq" value="<%=unq %>">

<table>
	<caption style="font-size:20px;
					font-weight:bold;">(답변게시판)수정화면</caption>
	<colgrop>
		<col width="20%"/>
		<col width="*"/>
	</colgrop>
		<tr>
			<th>제목</th>
			<td>
			<input type="text" name="title" style="width:99%;" value="<%=title %>" >
		
			</td>
		</tr>
		<tr>
			<th>암호</th>
			<td>
			<input type="password" name="pass" style="width:99%;">
			</td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td>
			<input type="text" name="name" style="width:99%;" value="<%=name %>" readonly>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
			<textarea name="content" style="width:99%;hight:100px;"><%=content %></textarea>
			</td>
		</tr>
	</table>
<div style="width:600px;
		    margin-top:10px;
		    text-align:center;">
	<!--type= submit : 엔터키 사용 가능 button: 엔터키 사용불가  -->
	<button type="button" onclick="history.back();">이전</button>
	<button type="submit" onclick="fn_submit(); return false;">저장</button>
	<button type="reset">취소</button>
</div>
</form>
	
	
		<!-- 본문 END -->
       </article>
    </section>
    <footer>
	<!-- footer S -->
		<%@ include file="../../include/footer.jsp" %>
	<!-- footer E -->
    </footer>
</div>
</body>
</html>