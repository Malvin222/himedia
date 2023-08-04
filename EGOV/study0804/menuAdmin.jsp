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
	/*text-align:left;*/
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

function fn_action(no,menuName){
	$("#menuName").val(menuName);
	$("#submit_button").text("수정");
	
}


	$(function(){
		$("#submit_button").click(function(){
			let menuName  = $.trim( $("#menuName").val() );
			if( menuName == ""){
				alert("메뉴명을 입력해주세요.");
				$("#menuName").focus();
				return false;
			}
			
			$.ajax({
				type  : "POST",
				url   : "menuRegister.do ",
				data  : {"menuName":menuName},
				
				datatype : "text",
				success  : function(data){
					if (data == "ok"){
						alert("저장완료");
						location ="/menuAdmin.do";
					} else {
						alert("저장실패");
					}
				} ,
				error    :  function(){
					alert("전송실패");
				}
			//에이작스	
			});
			
		//버튼클릭펑션	
		});
	});
</script>


<body>

<%@ include file="../../include/adminHeader.jsp" %>

<div class="content_area">

<form id="frm" >
	<table class="board1" align="center">
		<colgroup>
			<col width="25%"/>
			<col width="*"/>
		</colgroup>
		<tr>
			<th>메뉴</th>
			<td>
			<input type = "text" name="menuName" id="menuName">
			<button type="submit" id="submit_button" onclick="return false;">저장</button>
			<button type="button" onclick="location='/menuAdmin.do'">새로고침</button>
			</td>
		</tr>
</form>
	</table>
</div>
<div class="page_number_area">
	<table class="board1" align="center">
		<tr>
			<th width="20%">번호</th>
			<th width="*">메뉴명</th>
			<th width="20%">옵션</th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<td >${list.no}</td>			
				<td><a href="javascript:fn_action('${list.no }','${list.menuname}')">${list.menuname}</a></td>			
				<td><a href="">DEL</a></td>			
			</tr>
		</c:forEach>
	</table>
</div>

<div style="height:100px;"></div>

</body>
</html>
