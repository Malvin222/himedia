<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
	<link rel ="stylesheet" href="../../css/adminStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<script>
 $(function(){
	 
	$("#delete_button").click(function(){
		 
		let userid = $("#userid").val();
		let state = "${vo.state}";
		
		if(state != "4"){
			alert("삭제예정 회원이 아닙니다.");
			return false;
		}
				 
		if( !confirm("삭제 진행하시겠습니까?") ) {
			return false;
		}
			$.ajax({
			// 전송관련 세팅
			type : "POST",
		  data : { "userid":userid },
			url  : "/adminMemberdelete.do",
			
			// 반환관련 세팅
			datatype : "text",	// json : 여러형식의 데이터 값을 받을 수 있음 
			success  : function(data){
				if(data=="ok"){
				alert("삭제완료!");
				location= "/adminMemberList.do";
			} else {
					alert("삭제실패");
				}
				
			},
			error : function(){
				alert("전송실패!");
			}
			
		});
			
			
	});
	 
	 
	 $("#submit_button").click(function(){
		 
		 /*
		 *serialize(); : 폼안의 데이터 값들을 한번에 전송가능한 상태로 만듦
		 */
		 let form = $("#frm").serialize();
		 
			$.ajax({
			// 전송관련 세팅
			type : "POST",
		  data : form,
			url  : "/adminMemberModifySave.do",
			
			// 반환관련 세팅
			datatype : "text",	// json : 여러형식의 데이터 값을 받을 수 있음 
			success  : function(data){
				if(data=="ok"){
				alert("저장완료!");
				location= "/adminMemberList";
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
.board1 td{
	text-align:left;
}
.board1 textarea{
	width:400px;
	height:200px;
}
</style>

<body>

<%@include file="../../include/adminHeader.jsp" %>

<div class="content_area">
	
<form name="frm" id="frm" >
<table class="board1" align="center">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="userid" id="userid" value="${vo.userid }"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" id="name" value="${vo.name }"></td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td><input type="text" name="nickname" id="nickname" value="${vo.nickname}"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email" id="email"  value="${vo.email}"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="phone" id="phone"  value="${vo.phone}"></td>
	</tr>
	<tr>
		<th>휴대폰</th>
		<td><input type="text" name="mobile" id="mobile" value="${vo.mobile}"></td>
	</tr>
	<tr>
		<th>메일서비스</th>
		<td>
		<input type="checkbox" name="mail" id="mail" value="Y"
		<c:if test = "${vo.mail=='Y'}">checked</c:if> >
		</td>
	</tr>
	<tr>
		<th>sms서비스</th>
		<td><input type="checkbox" name="sms" id="sms" value="Y"
         <c:if test="${vo.sms == 'Y' }">checked</c:if>>
         </td>
	</tr>
	<tr>
		<th>상태</th>
		<td>
		<select name="state" id="state">
			<option value="1" <c:if test = "${vo.state=='1'}">selected</c:if> >정상</option>
			<option value="2" <c:if test = "${vo.state=='2'}">selected</c:if> >중지</option>
			<option value="3" <c:if test = "${vo.state=='3'}">selected</c:if> >탈퇴</option>
			<option value="4" <c:if test = "${vo.state=='4'}">selected</c:if> >삭제</option>
		</select>
		
		</td>
	</tr>
	<tr>
		<th>메모</th>
		<td>
		<textarea name="memo" id="memo"> ${vo.memo}</textarea>
		</td>
	</tr>
	<tr>
		<th>등록일</th>
		<td><input type="text" name="rdate" id="rdate" value="${vo.rdate}"></td>
	</tr>
	
</table>

<div style="margin-top:20px;">
	<button type="submit" id = "submit_button" >저장</button> 
	<button type="reset">새로고침</button> 
	<button type="button" id="delete_button">삭제</button>
</div>

<div style="height:100px;">

</div>
</form>

</div>
</body>
</html>




