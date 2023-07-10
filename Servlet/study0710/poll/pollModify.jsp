<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="conn.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection con = DbConnect.oracleCon();
	
	String code = request.getParameter("code");
	
	String sql1 = "select code "
				 +" ,title "
				 +" ,to_char(sdate,'yyyy-mm-dd') sdate "
				 +" ,to_char(edate,'yyyy-mm-dd') edate "
				 +" ,use "
				 +" from pollmain " 
				 +" where code='"+code+"'";
	Statement stmt1 = con.createStatement();
	ResultSet rs1 = stmt1.executeQuery(sql1);
	rs1.next();
	String title =rs1.getString("title");
	String sdate =rs1.getString("sdate");
	String edate =rs1.getString("edate");
	String use =rs1.getString("use");
	
	String checked = "Y";
	if(use.equals("N")) checked = "checked";
	String sql2= " select code "
			+" ,item "
			+" from pollsub " 
			+" where code like '"+code+"%' ";
	Statement stmt2 = con.createStatement();
	ResultSet rs2 = stmt1.executeQuery(sql2);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문등록</title>
</head>
<style>
body{
	font-size:12px;
	font-family:맑은고딕;
	line-height:2.0;
}
.table1{
	width:600px;
	border:1px solid #ccc;
	border-collapse:collpase;
}
.table1 th,td{
	padding:5px;
	border:1px solid #ccc;
}
.textarea{
	width:98%; height:100px;
}
.input{
	width:98%;
}
.div1{
	width:600px;
	text-align:center;
	margin-top:10px;
}
</style>
<script>
	function fn_submit(){
		
		var f =document.frm;
		if(f.title.value==""){
			alert("제목을 입력해주세요.");
			f.title.focus();
			return false;
		}
		var cnt =0;
		var len = document.getElementsByName("item").length;
		for(var i=0; i<len;i++){
			var item = document.getElementsByName("item")[i];
			if( f.item[i].value !=""){
				cnt++;
			}
			
		}
		if( cnt==0){
			alert("설문항목은 1개 이상이어야 합니다.");
			f.item[0].focus();
			return false;
		}
		if(f.sdate.value =="" || f.edate.value ==""){
			alert("설문기간을 선택해주세요");
			f.sdate.focus();
			return false;
		}
	f.submit();
	}

</script>
<body>
<form name="frm" method="post" action="/project_sv/pollModifySave">
<input type="hidden" name="mainCode" value="<%=code %>">

<table class="table1">
	<tr>
		<th>설문제목</th>
		<td><textarea name="title" class="textarea" ><%=title %></textarea></td>
	</tr>
	<tr>
		<th>설문항목</th>
		<td>
		<%
		int cnt=0;
		while(rs2.next()){
			String code_sub = rs2.getString("code");	
			String item = rs2.getString("item");
		%>	
		<input type="text" name="item" value="<%=item%>" class="input"><br>
		<%
			cnt++;
		}
		while(cnt < 10){
		%>	
			<input type="text" name="item" class="input1"><br>
		<%
			cnt++;
		}
		%>
		</td>
	</tr>
	<tr>
		<th>설문기간</th>
		<td>
		<input type="date" name="sdate" value="<%=sdate%>"> ~
		<input type="date" name="edate" value="<%=edate%>"> 
		<input type="checkbox" name="use" value="N" <%=checked %>>숨김 
		</td>
	</tr>
</table>
<div class="div1">
	<button type="submit" onclick="fn_submit();return false;">저장</button>
	<button type="reset">취소</button>
</div>
</form>
</body>
</html>