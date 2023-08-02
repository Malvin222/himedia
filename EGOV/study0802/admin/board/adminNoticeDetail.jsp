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
<title>공지사항관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<script>
$(function(){
	$("#button1").click(function(){		//목록
		location = "/adminNoticeList.do";
	});
	$("#button2").click(function(){		//수정
	      $("#frm").attr("action","/adminNoticeModify.do");
	      $("#frm").submit();

	});
	
	$("#button3").click(function(){		//삭제
		if(confirm("정막삭제하시겠습니까?")){
			fn_submit("/adminNoticeDelete.do");
		}
	});
	
});
function fn_submit(url){
		 /**
		 	serialize(); : 폼안의 데이터 값들을 한번에 전송가능한 상태로 만듦
		 */
		 var form = $("#frm").serialize();

			$.ajax({
			// 전송관련 세팅
			type : "POST",
		  data : form,
			url  : url,
			
			// 반환관련 세팅
			datatype : "text",	// json : 여러형식의 데이터 값을 받을 수 있음 
			success  : function(data){
				if(data=="ok"){
				alert("삭제완료!");
				location= "/adminNoticeList.do";
			} else {
					alert("삭제실패");
				}
				
			},
			error : function(){
				alert("전송실패!");
			}
			
		});
}	
</script>

<style>
body { font-size:12px; font-family:맑은고딕; }
a { color:#0a0ccc; text-decoration:none; }
.topMenu_area {
	width:100%;
	height:70px;
	text-align:center;
	background:yellow;
}
.subMenu_area {
	width:100%;
	height:30px;
	text-align:center;
	background:skyblue;
	line-height:2.5;
	margin-bottom:30px;
}
.content_area {
	width:100%;
	text-align:center; 
}
.page_number_area {
	width:100%;
	text-align:center;
	padding-top:20px;
} 
.board1 {
	width:800px;
	border-top:2px solid #474747;
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
}
.board1 th {
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
	padding:5px;
	height:30px;
}
.board1 td {
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
	padding:5px;
	text-align:left;
	height:20px;
}
.input1 { width:98%; }
.textarea1 { width:98%; height:200px;}

</style>

<body>

<div class="topMenu_area">
	<div style="height:30px;">&nbsp;</div>
	<div>
		<a href="/adminNoticeList.do?menu=1">공지관리</a> |  
		<a href="/adminMemberList.do?menu=2">회원관리</a> |
		<a href="/adminGoodsList.do?menu=3">상품관리</a> | 
		<a href="/adminReserveList.do?menu=4">예약관리</a>
	</div>
</div>
<div class="subMenu_area">
	<a href="/adminNoticeWrite.do?menu=1">공지등록</a> 
	<a href="/adminNoticeList.do?menu=1">공지목록</a>
	<a href="/adminMemberWrite.do?menu=2">회원등록</a> 
	<a href="/adminMemberList.do?menu=2">회원목록</a>
	<a href="/adminGoodsWrite.do?menu=3">상품등록</a>
	<a href="/adminGoodsList.do?menu=3">상품목록</a>
</div>
<div class="content_area">
	

<form name="frm" id="frm" >
<input type="hidden" name="unq" value="${vo.unq}">
<table class="board1" align="center">
	<tr>
		<th width="20%">제목</th>
		<td width="*"><div>${vo.title}</div></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><div>${vo.name}</div></td>
	</tr>
	<tr>
		<th>강조</th>
		<td style="text-align:left;">
		<input type="checkbox" name="emps" id="emps"
		<c:if test="${vo.emps =='Y' }">checked</c:if> >공지
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><div>${vo.content }</div></td>
	</tr>
</table>

<div style="margin-top:20px;">
	<button type="button" id="button1">목록</button> 
	<button type="button" id="button2">수정</button> 
	<button type="button" id="button3">삭제</button> 
</div>
</form>

</div>
</body>
</html>
