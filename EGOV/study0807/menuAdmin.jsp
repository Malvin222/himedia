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

function fn_action(no,menuname,useyn){	 //수정처리
	$("#menuname").val(menuname);
	$("#no").val(no);
	$("#submit_button").text("수정");
	
	if(useyn =="Y"){
		$("#useyn").val("Y").prop("selected",true);
	}else{
		$("#useyn").val("N").prop("selected",true);

	}
}
function fn_delete(no){		
	
	$.ajax({
		type  : "POST",
		url   : "menuDelete.do ",
		data  : {"no":no},
		
		datatype : "text",
		success  : function(data){
			if (data == "ok"){
				alert("삭제완료");
				location ="/menuAdmin.do";
			} else {
				alert("삭제실패");
			}
		} ,
		error    :  function(){
			alert("전송실패");
		}
	//에이작스	
	});
	
}

	$(function(){
		$("#submit_button").click(function(){
			
			let menuname  = $.trim( $("#menuname").val() );
			let no = $("#no").val();
			let useyn = $("#useyn").val();

			if( menuname == ""){
				alert("메뉴명을 입력해주세요.");
				$("#menuname").focus();
				return false;
			}
			
			$.ajax({
				type  : "POST",
				url   : "menuRegister.do ",
				data  : {"menuname":menuname, "no":no ,"useyn":useyn },
				
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
	<input type="hidden" name="no" id="no">
	<table class="board1" align="center">
		<colgroup>
			<col width="25%"/>
			<col width="*"/>
		</colgroup>
		<tr>
			<th>메뉴</th>
			<td>
			<select name ="useyn" id="useyn">
				<option value="Y">사용</option>
				<option value="N" selected>미사용</option>
			</select>
			<input type = "text" name="menuname" id="menuname">
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
			<th width="20%">사용여부</th>
			<th width="20%">옵션</th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<td><input type="text" name="no" id="no" value="${list.no}" style="width:10px; text-align:rightr;"></td>			
				<td><a href="javascript:fn_action('${list.no }','${list.menuname}','${list.useyn }')">${list.menuname}</a></td>			
				<td>
				<c:if test="${list.useyn == 'Y' }">사용</c:if>
				<c:if test="${list.useyn == 'N' }">미사용</c:if>
				</td>
				<td><a href="javascript:fn_delete('${list.no }')">DEL</a></td>			
			</tr>
		</c:forEach>
	</table>
</div>

<div style="height:100px; margin-top:20px;">
	<table width="810" align="center">
		<tr>
			<td align="right">
				<button type="button" id="fn_noChange()">출력순서 변경</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
