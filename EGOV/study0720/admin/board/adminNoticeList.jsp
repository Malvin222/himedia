<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

.board1 {
	width:1000px;
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

</style>
<body>

<div style="width:100%; height:70px; text-align:center; background:yellow;">
	<a href="/adminNoticeList.do">공지관리</a> | 회원관리 

</div>
<div>
			<table class="board1">
					<colgroup>
						<col width="10%"/>
						<col width="*"/>
						<col width="15%"/>
						<col width="10%"/>
						<col width="10%"/>
					</colgroup>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조회</th>
					</tr>
					<tr>
						<td>공지</td>
						<td style="text-align:left;">신용카드 이용내역 조회</td>
						<td>관리자</td>
						<td>2023/07/20</td>
						<td>2000</td>
					</tr>
				</table>
</div>
</body>
</html>