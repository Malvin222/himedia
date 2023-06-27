<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../../include/oracleCon.jsp"%>
<!-- 파라메터 값 설정 -->
<%
	String unq     = request.getParameter("unq");
	String title   = request.getParameter("title");
	String pass    = request.getParameter("pass");
	String name    = request.getParameter("name");
	String content = request.getParameter("content");
%>
<!-- 널값 체크(제목,암호) -->
<%
	if (title == null || pass == null ||unq == null) {
%>
<script>
	alert("잘못된 경로로의 접근입니다.");
	location="reBoardList.jsp";
</script>
<%
	return; //jsp중단
	}
	title = title.trim();	//앞뒤 공백 제거
	pass  = pass.trim();
%>
<!-- 패스워드 비교 -->
<% 
String sql1 = "select count(*) cnt from reBoard " 
			  +" where unq='"+unq+"' and pass='"+pass+"'";
Statement stmt1 = con.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);
rs1.next();
int cnt = rs1.getInt("cnt");
if(cnt ==0){
%>
	<script>
		alert("암호가 일치하지 않습니다.");
		history.back();
	</script>
<%	
	return;
}
%>
<!-- 저장(변경) -->
<% String sql2 = " update reBoard set  "
				 +" title='"+title+"', "
				 +" name='"+name+"', "
				 +" content='"+content+"' "
				 +" where unq='"+unq+"'";
Statement stmt2 = con.createStatement();
int result = stmt2.executeUpdate(sql2); 
%>
<!-- 메세지 출력 -->
<%
if(result ==1){
%>	
<script>
	alert("수정 완료")
	location="reBoardList.jsp";
</script>
<%	
}else{
%>
<script>
	alert("수정 실패")
	history.back();
</script>
<% 
}
%>