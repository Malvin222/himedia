<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>
<!-- 파라메터 값 설정 -->
<%
	String userid =(String)session.getAttribute("SessionUserId");
	String date = request.getParameter("date");
	String title = request.getParameter("title");
	String content =request.getParameter("content");
	String view1 = request.getParameter("view1");
%>

<!-- 중요 데이터 값의 널값 체크 아이디/암호/이름 -->
<%
	if (userid == null || date==null){
%>
	<script>
		alert("잘못된 경로로의 접근입니다.");
		history.back();
	</script>	
<%
}
%>
<!-- 데이터 저장 -->
<% 
String sql1 = "insert into sche_mgr( "
			+" unq, "
			+" userid, "
			+" sche_date, "
			+" title, "
			+" content, "
			+" view1) " 
			+" values( "
			+" sche_mgr_seq.nextval, "
			+" '"+userid+"', "
			+" '"+date+"', "
			+" '"+title+"', "
			+" '"+content+"', "
			+" '"+view1+"')";
	Statement stmt1 = con.createStatement();
	int result1 = stmt1.executeUpdate(sql1);

	if(result1 ==1){
%>
	<Script>
		alert("일정 등록 완료");
		location="planMain.jsp"
	</Script>
<%
	}else{
%>
	<Script>
		alert("일정등록 실패");
		history.back();
	</Script>
<%
	return;
	}
%>
