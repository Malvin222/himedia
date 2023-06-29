<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file = "../include/oracleCon.jsp" %>
<!-- 파라미터 -->
<% 
	String p1 = request.getParameter("pass1");
	String p2 = request.getParameter("pass2");
	String p3 = request.getParameter("pass3");
%>
<!-- 널체크 -->
<% if (p1 == null || p2 == null){ %>
	<Script>
		alert("잘못된 경로로의 접근입니다.");
		history.back;
	</Script>
<%
	return;
} 
%>
<!-- 저장된 암호와의 일치여부 SQL작성/적용 및 비교 -->
<% 
String userid =(String)session.getAttribute("SessionUserId");
String sql = "select count(*) cnt from memberinfo "
			+"where userid='"+userid+"' and userpw='"+p1+"' ";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");
if(cnt == 0){
%>
	<Script>
	alert("비밀번호를 잘못 입력했습니다.");
	self.close();
	</Script>
<%	
}
%>
<!-- 암호변경 SQL작성/적용 -->
<%
	String sql2 = "update memberinfo set userpw= '"+p2+"' "
				   +" where userid ='"+userid+"' ";
	Statement stmt2 = con.createStatement();
	int result = stmt2.executeUpdate(sql2); 
%>
<!-- 메세지 출력 -->
<%
if(result ==1){
%>
<script>
	alert("변경 완료");
	opener.location="../main/main.jsp"
	self.close();
</script>
<%
}else{
%>
<script>
	alert("변경 실패 \n다시 로그인해주세요.");
	self.close();
	opener.location="../member/loginWrite.jsp"
</script>
<% 
}
%>