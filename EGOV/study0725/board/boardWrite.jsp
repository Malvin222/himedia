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
		 /**
		 	serialize(); : 폼안의 데이터 값들을 한번에 전송가능한 상태로 만듬
		 */
		 // var form = $("#frm").serialize();
			var title = $("#title").val();
			var pass = $("#pass").val();
			var name = $("#name").val();
			var content = $("#content").val();
			var sendData = "title="+title+"&pass="+pass+"&name="+name+"&content="+content;
		 	
			$.ajax({
			// 전송관련 세팅
			type : "POST",
			data : sendData,
		  //data : form,
			url  : "/boardWriteSave.do",
			
			// 반환관련 세팅
			datatype : "text",	// json : 여러형식의 데이터 값을 받을 수 있음 
			success  : function(data){
				if(data=="true"){
				alert("저장완료!");
				location= "/boardList.do";
			} else if(data == "len_over") {
				alert("암호는 6~12자 사이로 설정해주세요.");		
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