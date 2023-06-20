<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변형 게시판 등록 화면</title>
</head>
<style>
body{
 font-size:12px;
 font-family:맑은 고딕;
}
table{
	width:600px;
	border:1px solid #555;
	border-collapse:collapse;
}
th,td{
	border:1px solid #555;
	padding:5px;
}
</style>
<Script>
function fn_submit(){
	var f = document.frm;
	if(f.title.value =="") {
		alert("제목을 입력해주세요");
		f.title.focus();
		return false;	//종료
	}
	if(f.pass.value ==""){
		alert("암호를 입력해주세요");
		f.pass.focus();
		return false;	//종료
	}
	f.submit();  //전송
}


</Script>
<body>
<form name="frm" method="post" action="reBoardWriteSave.jsp">
<table>
	<caption style="font-size:20px;
					font-weight:bold;">(답변형) 등록화면</caption>
	<colgrop>
		<col width="20%"/>
		<col width="*"/>
	</colgrop>

		<tr>
			<th>제목</th>
			<td>
			<input type="text" name="title" style="width:99%;" >
			</td>
		</tr>
		<tr>
			<th>암호</th>
			<td>
			<input type="password" name="pass" style="width:99%;" >
			</td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td>
			<input type="text" name="name" style="width:99%;" >
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
			<textarea name="content" style="width:99%;hight:100px;"></textarea>
			</td>
		</tr>
	</table>
<div style="width:600px;
		    margin-top:10px;
		    text-align:center;">
	<!--type= submit : 엔터키 사용 가능 button: 엔터키 사용불가  -->
	<button type="submit" onclick="fn_submit(); return false;">저장</button>
	<button type="reset">취소</button>
</div>
</form>
</body>
</html>