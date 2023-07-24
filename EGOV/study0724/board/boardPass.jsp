<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호입력화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<script>
$(function(){
	$("#button1").click(function(){ 
		
		if( $("#pass").val() == "" ) {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		var form = $("#frm").serialize();
		$.ajax({
			// 전송 세팅
			type : "POST",
			data : form,
			url  : "/boardDelete.do",
			// 리턴 세팅
			datatype : "text",
			success : function(data) {
				 if(data == "ok") {
					alert("삭제완료!");
					location = "/boardList.do";
				 } else if(data == "fail") {
					 alert("암호가 일치하지 않습니다.!");
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
<p>
<form id="frm">
	<input type="hidden" name="unq" value="${vo.unq }">
	암호 : <input type="password" name="pass" id="pass">
	<button type="button" id="button1">삭제</button>
</form>

</body>
</html>