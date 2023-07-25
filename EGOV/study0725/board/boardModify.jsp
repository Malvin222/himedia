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
		 
		 if( $("#title").val() == "" ) {
			 alert("제목을 입력해주세요.");
			 $("#title").focus();
			 return false;
		 }
		 if( $("#pass").val() == "" ) {
			 alert("암호를 입력해주세요.");
			 $("#pass").focus();
			 return false;
		 }
		 
		 /**
		  * serialize() : 폼안의 데이터 값들을 한번에 전송가능 상태로 만듬
		  */
		  var form = $("#frm").serialize();
		 
		  $.ajax({
			 // 전송관련 세팅
			 type : "POST",
			 data :  form,
			 url  : "/boardModifySave.do",
			 
			 // 반환관련 세팅 
			 datatype : "text", // json
			 success : function(data) {

				 if(data == "ok") {
					alert("수정완료!");
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
[ 게시판 수정화면 ]
<!-- 제목, 암호, 이름, 내용 --> 
<form name="frm" id="frm">

<input type="hidden" name="unq" value="${vo.unq }">

 <table border="1" width="600">
 	<tr>
 		<th>제목</th>
 		<td><input type="text" name="title" id="title" value="${vo.title }"></td>
 	</tr>
 	<tr>
 		<th>암호</th>
 		<td><input type="password" name="pass" id="pass"></td>
 	</tr>
 	<tr>
 		<th>이름</th>
 		<td><input type="text" name="name" id="name" value="${vo.name }"></td>
 	</tr>
 	<tr>
 		<th>내용</th>
 		<td> <textarea name="content" id="content">${vo.content }</textarea> </td>
 	</tr> 
 </table>
 <div>
 	<button type="button" id="button1">저장</button>
 	<button type="reset">취소</button>
 </div>
 </form>

</body>
</html>