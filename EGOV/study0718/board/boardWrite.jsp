<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		var form = $("#frm").serialize();
		$.ajax({
			
			type : "POST",
			data : form,
			url  : "/boardWriteSave.do",
			datatype : "text",
			success  : function(data){
				if(data=="true"){
				alert("저장완료!");
				location= "/boardList.do";
			} else{
				alert("저장실패!");	
	
				}
				
			},
			error : function(){
				alert("저장실패!");
			}
			
		});
			
	 });
	 	
 });
</script>
<body>
[게시판 등록화면]
<!-- 제목, 암호, 이름, 내용 -->
<form name="frm" id="frm" >
<table border="1" width="600">
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" id="title"></td>
	</tr>
	<tr>
		<th>암호</th>
		<td><input type="password" name="pass" id="pass"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" id="content"></textarea></td>
	</tr>
</table>

<div>
<button type="button" id="button1">등록</button> 
<button type="reset">취소</button> 
</div>
</form>

</body>
</html>