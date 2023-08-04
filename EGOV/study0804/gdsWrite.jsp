<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
   	<link rel="stylesheet" href="../../css/adminStyle.css">
   	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<style>
.board1 td {
	text-align:left;
}
.board1 textarea {
	width:500px;
	height:200px;
	font-size:12px;
	color:#555555;
	font-family:맑은고딕;
}
</style>

<script>
/*
 * processData: false  --> jQuery의 전송형식을 연결형식으로 하지 않겠다. 
 * contentType: false  --> 전송내용에 파일이 포함되는 경우
   contentType : default 값은 "application/x-www-form-urlencoded; charset=UTF-8", 
   "multipart/form-data"로 전송되도록 false 설정
 */
$(function(){
	
	$("#submit_button").click(function(){
		
		//var frm1 = $("#frm").serialize();
		var form = new FormData(document.getElementById('frm'));
		$.ajax({
			/*서버송신설정*/
			type : "POST",
			data :  form,
			url  : "/gdsWriteSave.do",
			processData: false, // 파일이 전송되는 경우의 설정
  			contentType: false, // 파일이 전송되는 경우의 설정
  			
  			/*서버응답설정*/
			datatype : "text", // json
			success : function(data) {
				 if(data == "ok") {
					alert("저장완료!");
					location = "/gdsList.do";
				 } else {
					 alert("저장실패!");
				 }
			 },
			 error : function() {
				 alert("전송실패");
			 }
		});
	});
});
</script>

<body>

<%@ include file="../../include/adminHeader.jsp" %>

<div class="content_area">

<form id="frm" enctype="multipart/form-data">
	<table class="board1" align="center">
		<colgroup>
			<col width="25%"/>
			<col width="*"/>
		</colgroup>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="userid" id="userid" value="${vo.userid }"></td>
		</tr>
		<tr>
			<th>파일</th>
			<td>
			<input type="file" name="file1" id="file1" style="width:50%"> <br>
			<input type="file" name="file2" id="file2" style="width:50%">
			</td>
		</tr>

	</table>
</div>
<div class="page_number_area">
	<button type="submit" id="submit_button" onclick="return false;">저장</button>
	<button type="reset">새로고침</button>
	<button type="button" id="delete_button">삭제</button>
</div>

<div style="height:100px;"></div>

</form>
</body>
</html>
