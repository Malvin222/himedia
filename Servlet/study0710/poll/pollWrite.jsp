<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form name="frm" method="post" action="/project_sv/pollWriteSave">
<table class="table1">
	<tr>
		<th>설문제목</th>
		<td><textarea name="title" class="textarea"></textarea></td>
	</tr>
	<tr>
		<th>설문항목</th>
		<td>
		<%
		for(int i=1; i<=10; i++){
		%>	
		<input type="text" name="item" class="input"><br>
		<%
		}
		%>
		</td>
	</tr>
	<tr>
		<th>설문기간</th>
		<td>
		<input type="date" name="sdate"> ~
		<input type="date" name="edate"> 
		<input type="checkbox" name="use" value="N">숨김 
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