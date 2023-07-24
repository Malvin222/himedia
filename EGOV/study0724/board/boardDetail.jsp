<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<script>
$(function(){
	
	$("#button1").click(function(){  // 목록
		location = "/boardList.do";
	});
	$("#button2").click(function(){  // 수정
		$("#frm").attr("action","/boardModify.do"); // 속성 값 세팅
		$("#frm").submit();
	});
	$("#button3").click(function(){  // 삭제
		$("#frm").attr("action","/boardPass.do");
		$("#frm").submit();
	});
	
});


</script>

<body>
[ 게시판 상세보기 ]

<form name="frm" id="frm" method="post">
 <input type="hidden" name="unq" value="${vo.unq }">

 <table border="1" width="600">
 	<tr>
 		<th width="25%">제목</th>
 		<td>${vo.title }</td>
 	</tr>
 	<tr>
 		<th>이름</th>
 		<td>${vo.name }</td>
 	</tr>
 	<tr>
 		<th>내용</th>
 		<td height="100">${vo.content }</td>
 	</tr>
 	<tr>
 		<th>등록일</th>
 		<td>${vo.rdate }</td>
 	</tr>
 </table>
 <div>
 	<button type="button" id="button1">목록</button>
 	<button type="button" id="button2">수정</button>
 	<button type="button" id="button3">삭제</button>
 </div>
 </form>

</body>
</html>