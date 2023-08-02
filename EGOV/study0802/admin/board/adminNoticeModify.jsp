<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	 		
	 $("#button1").click(function(){
		 if($("#title").val() =="" ){
			 alert("제목을 입력해주세요.");
			 $("#title").focus();
			 return false;
		 }
		 if($("#pass").val() =="" ){
			 alert("암호을 입력해주세요.");
			 $("#pass").focus();
			 return false;
		 }
		 /**
		 	serialize(); : 폼안의 데이터 값들을 한번에 전송가능한 상태로 만듬
		 */
		 var form = $("#frm").serialize();

			$.ajax({
			// 전송관련 세팅
			type : "POST",
		  data : form,
			url  : "/adminNoticeModifySave.do",
			
			// 반환관련 세팅
			datatype : "text",	// json : 여러형식의 데이터 값을 받을 수 있음 
			success  : function(data){
				if(data=="ok"){
				alert("저장완료!");
				location= "/adminNoticeList.do";
			} else {
					alert("저장실패");
				}
				
			},
			error : function(){
				alert("전송실패!");
			}
			
		});
			
	 });
	 	
 });
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
	text-align:center;
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
<table class="board1" align="center">
	<tr>
		<th width="20%">제목</th>
		<td width="*"><input type="text" name="title" id="title" class="input1" value="${vo.title }"></td>
	</tr>
	<tr>
		<th>암호</th>
		<td><input type="password" name="pass" id="pass" class="input1"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" id="name" class="input1" value="${vo.name}"></td>
	</tr>
	<tr>
		<th>강조</th>
		<td style="text-align:left;">
		<input type="checkbox" name="emps" id="emps" value="Y">공지
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" id="content" class="textarea1">${vo.content }</textarea></td>
	</tr>
</table>

<div style="margin-top:20px;">
	<button type="button" id="button1">등록</button> 
	<button type="reset">취소</button> 
</div>
</form>

</div>
</body>
</html>




