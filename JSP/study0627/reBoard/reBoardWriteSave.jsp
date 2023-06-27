<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../../include/oracleCon.jsp"%>
<!-- 파라메터 값 설정 -->
<%
	String title = request.getParameter("title");
	String pass  = request.getParameter("pass");
	String name  = request.getParameter("name");
	String content = request.getParameter("content");
%>
<!-- 널값 체크(제목,암호) -->
<%
	if (title == null || pass  == null){
%>
		<script>
			alert("잘못된 경로로 접근");
			location="reBoardList.jsp"
		</script>
<%
return;
}
	title = title.trim();
	pass  = pass.trim();
	
if(title.equals("")|| pass.equals("")){
%>
		<script>
		alert("제목 또는 암호를 입력해주세요");
		history.back();
		</script>
<%
	return;
}
%>
<!-- gid값 추출 SQL 작성 및 적용 -->
<%
	String sql1 = "select nvl(max(gid),0)+1 as mygid from reboard";
	Statement stmt1 = con.createStatement();
	ResultSet rs1 = stmt1.executeQuery(sql1);
	rs1.next();
	String mygid = rs1.getString("mygid");
%>
<!-- 입력 SQL 작성 및 적용 -->
<%
	String sql2 = " insert into reboard(unq,title,pass,name,content,rdate,gid,thread) " 
					+" values (reboard_seq.nextval,'"+title+"','"+pass+"','"+name+"','"+content+"',sysdate,'"+mygid+"','a') ";
	Statement stmt2 = con.createStatement();
	int result =stmt2.executeUpdate(sql2);
%>
<!-- 결과 메세지 출력 -->
<%if (result == 1) {
%>
	<script>
		alert("작성완료");
		location = "reBoardList.jsp";
	</script>
<%
}else{
%>
	<Script>
		alert("작성실패");
		history.back();
	</Script>
<%
return;
} 
%>
	