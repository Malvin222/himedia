<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/oracleCon.jsp"%>;

<!-- 파라미터 -->
<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
%>

<!-- SQL -->
<%
	 String sql = "select count(*) cnt from memberinfo "
	 			 +" where userid='"+userid+"' and userpw='"+userpw+"' ";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	int cnt = rs.getInt("cnt");
	if(cnt == 0 ){
%>
		<script>
		alert("인증에 실패했습니다. \n아이디와 암호를 다시 확인해주세요.");
		history.back();
		</script>
<%
	return;
	}
%>
<!-- 세션변수 -->
<%
//SessionUserId
//String SessionUserId = "test123";
//세션변수 생성
session.setAttribute("SessionUserId", userid);
session.setMaxInactiveInterval(3600);
%>
<Script>
	alert("<%=userid%>님 환영합니다.");
	location="../main/main.jsp";
</Script>