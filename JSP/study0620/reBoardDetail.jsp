<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file ="../../include/oracleCon.jsp" %>

<!-- 파라메터 값 세팅 -->
<%
	String unq = request.getParameter("unq");
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
<!-- 상세보기 SQL 작성 및 적용 -->
<%
	String sql =" select title,name,content,rdate " 
				+" from reBoard where unq='"+unq+"' ";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next() == false ){
%>
	<Script>
	alert("잘못된 경로로의 접근");
	location="reBoardList.jsp";
	</Script>
<% 	
	return;
	}
	String title = rs.getString("title");
	String name = rs.getString("name");
	String content = rs.getString("content");
	String rdate = rs.getString("rdate");
	stmt.executeUpdate
		("update reBoard set hits = hits+1 where unq='"+unq+"' "	);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(답변)게시판 상세화면</title>
</head>
<style>
body{
 font-size:12px;
 font-family:맑은 고딕;
}
table{
	width:600px;
	border:1px solid #555;
	border-collapse:collapse;
}
th,td{
	border:1px solid #555;
	padding:5px;
}
</style>
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
<form name="frm" method="post" action="reBoardWriteSave.jsp">
<table>
	<caption style="font-size:20px;
					font-weight:bold;">(답변게시판)상세화면</caption>
	<colgrop>
		<col width="20%"/>
		<col width="*"/>
	</colgrop>

		<tr>
			<th>제목</th>
			<td><%=title%></td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td><%=name%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
			<div>
			<%=content%>
			</div>
			</td>
		</tr>
		<tr>
			<th>등록일시</th>
			<td><%=rdate%></td>
		</tr>
	</table>
<div style="width:600px;
		    margin-top:10px;
		    text-align:center;">
	<!--type= submit : 엔터키 사용 가능 button: 엔터키 사용불가  -->
	<button type="button" onclick="history.back();">이전</button>
	<button type="button" onclick="location='reBoardModify.jsp?unq=<%=unq%>'">수정</button>
	<button type="button" onclick="location='passWrite.jsp?unq=<%=unq%>'">삭제</button>
	<button type="button" onclick="location='reBoardReply.jsp?unq=<%=unq%>'">답글</button>
</div>
</form>
</body>
</html>