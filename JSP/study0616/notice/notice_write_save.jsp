<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../include/oracleCon.jsp" %>
<% 
   Statement stmt = con.createStatement();
%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String unq = request.getParameter("unq");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String hits = request.getParameter("hits");
	String rdate = request.getParameter("rdate");

	if(title == null || title.equals("") ){
%>
	<script>
	title("제목를 입력해주세요.");
	history.back()	//이전 페이지로 돌려보냄
	</script>
<%
	return; //jsp 종료
	}

	if(content == null || content.equals("") ){
%>
	<script>
	alert("내용을 입력해주세요");
	history.back(); //이전페이지로 돌려보냄
	</script>
<%
	return; //jsp 종료
	}
	
String sql = "insert into notice (unq,title,content,hits,rdate)" 
			 +"values(notice_unq.nextval "
					 +",'"+title+"'"
					 +",'"+content+"'"
					 +",'0'"
					 +",sysdate)";
int result = stmt.executeUpdate(sql) ;
if(result == 1){
%>
	<script>
	alert("저장완료");
	location ="notice_list.jsp";
	</script>
<%
} else{
	
%>	
	<script>
	alert("저장실패!!");
	history.back();
	</script>
<%
}
%>