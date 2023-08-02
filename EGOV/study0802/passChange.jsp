<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호변경</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<script>
$(function(){ 	
	$("#idpw1").click(function(){
		$("#id_area").css('display','none');
	});
	$("#idpw2").click(function(){
		$("#id_area").css('display','block');
	});
	
	$("#button1").click(function(){
		
		let pass1    = $.trim($("#pass1").val());
		let pass2	 = $.trim($("#pass2").val());
		let pass3 	 = $.trim($("#pass3").val());
		
		if(pass1 == "") {
			alert("현재암호를 입력해주세요.");
			$("#pass1").focus();
			return false;
		}
		if(pass2.length < 4 || pass2.length > 20 ) {
			alert("새암호는 4자~20자 사이로 해주세요.");
			$("#pass2").focus();
			return false;
		}
		if(pass2 != pass3) {
			alert("변경암호가 일치하지 않습니다..");
			$("#pass3").focus();
			return false;
		}
		
		//let datas = "userid="+userid+"&nickname="+nickname+"&email="+email;
		
		//JSON 형식 세팅
		let datas = {"pass1":pass1,"pass2":pass2,"pass3":pass3};
		$.ajax({
			url  : "/passChangeSub.do",
			type : "post",
			data : datas,
			
			datatype : "text",
			success : function(data) {
				if( data == "4" ) {
					alert("현재암호가 일치하지 않습니다.");
					$("#pass1").focus();
				} else if(data =="1") {
					alert("암호가 변경되었습니다. \n 다시 로그인 시 적용됩니다.");
				} else{
					alert("변경실패");
				}
			},
			error : function() {
				 alert("전송실패");
			}
		});
	});
});
</script>
<style>
body{
font-size:12px;
}

#wrap{
	width:398px;
	height:290px;
	padding:5px;
	border:1px solid #cccccc;
}
#id_area{
	width:98%;
	padding:1px;
	margin-bottom:10px;
}
#nick_area{
	width:98%;
	padding:1px;
	margin-bottom:10px;
}
#radio_area {
	width:94%;
	padding:6px;
	margin-bottom:3px;
}
#mail_area{
	width:98%;
	padding:1px;
	margin-bottom:10px;
}
#button_area {
	width:94%;
	padding:6px;
	margin-bottom:3px;
}
#result_area {
	width:94%;
	padding:6px;
	margin-bottom:3px;
}
</style>

<body>
<div id="wrap">
	<div id="id_area"> 현재암호 <input type="password" name="pass1" id="pass1"></div>
	<div id="nick_area"> 변경암호 <input type="password" name="pass2" id="pass2"></div>
	<div id="mail_area"> 암호확인 <input type="password" name="pass3" id="pass3"></div>
	<div id="button_area">
		<button type="submit" id="button1" onclick="return false;">전송</button>
		<button type="reset">취소</button>
	</div>
	<div id="result_area">결과 :<span id="result_text"></span></div>
</div>

</body>
</html>