<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../../include/oracleCon.jsp"%>
<!-- 파라메터 값 설정 -->
<%
	String unq = request.getParameter("unq");	//원글
	String title = request.getParameter("title");
	String pass  = request.getParameter("pass");
	String name  = request.getParameter("name");
	String content = request.getParameter("content");
%>
<!-- sql gid,thread -->
<% 
	String sql1 ="select gid,thread from reBoard where unq='"+unq+"' ";
	Statement stmt1 = con.createStatement();
	ResultSet rs1 = stmt1.executeQuery(sql1);
	rs1.next();
	
	String dbGid = rs1.getString("gid");
	String dbThread = rs1.getString("thread"); //원글쓰레드
	
	String sql2 =" select nvl(max(thread),'1') as maxThread from reboard where gid='"+dbGid+"' and thread like '"+dbThread+"_' ";
	Statement stmt2 =con.createStatement();
	ResultSet rs2 = stmt2.executeQuery(sql2);
	
	rs2.next();
	
	String maxThread = rs2.getString("maxThread");
	String myThread="";
	if(maxThread.equals("1")){
		//a -> a+"a"
		myThread = dbThread+"a";
	}else {
		//ac -->ad
		//"a",'c' ;; 'c'++ -> 'd' ;;'a' +'d'
	char lastWord = maxThread.charAt(maxThread.length()-1);
		lastWord++;
		myThread = dbThread + lastWord;
	}
	
	
	String sql3 = " insert into reboard(unq,title,pass,name,content,rdate,gid,thread) " 
					+" values (reboard_seq.nextval,'"+title+"','"+pass+"','"+name+"','"+content+"',sysdate,'"+dbGid+"','"+myThread+"') ";
	Statement stmt3 = con.createStatement();
	int result =stmt2.executeUpdate(sql3);
%>
<!-- 결과 메세지 출력 -->
<%if (result == 1) {
%>
	<script>
		alert("댓글작성완료");
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
	