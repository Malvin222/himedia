<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>
<!-- 인증연결 -->
<%@ include file="../include/certify.jsp" %>
<!-- 파라미터 값 받기 -->
<%
String sche_date = request.getParameter("sche_date");
%>
<!-- delete SQL 작성 및 적용 -->

<%
//userid와 sche_date를 비교하여 삭제
String sql = " delete from sche_mgr "
			 +" where userid='"+SessionUserId+"' " 
			 +" and to_char(sche_date,'yyyy-mm-dd')='"+sche_date+"' ";
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if(result ==1 ){
%>
	<script>
	alert("일정삭제 완료");
	location="planMain.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("일정삭제 실패");
	location="planMain.jsp";
	</script>
<%
}
%>