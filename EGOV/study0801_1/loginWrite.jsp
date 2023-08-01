<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
	<link href="./css/default.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/nav.css">
    <style>
        textarea , h1,h2,h3{
            font-family: 'Nanum Gothic', sans-serif;
            font-size: 1em;
        }
        p{
            margin: 0;
            padding: 0;
            word-break: break-all;
        }
        #container {
            position: relative;
            min-height: 500px;
            height: auto !important;
            background: #fff;
            zoom: 1;
        }
        #wrapper{
            z-index: 5;
            margin: 20px auto;
            width: 1000px;
            zoom: 1;
            position: relative;
        }
        #chapter_1 , #chapter_2{
            display: block;
            margin-bottom: 10px;
            padding: 5px;
            width: 98%;
            height: 150px;
            border: 1px solid #e9e9e9;
            background: #f7f7f7;
        }
        .btn_submit {
            width: 120px;
            height: 53px;
            border: 0;
            border-radius: 5px;
            padding: 13px 0;
            font-size: 1.09em;
            font-weight: bold;
            letter-spacing: 0;
            background-color: #86bf62;
            color: #fff;
            margin: 0;
            vertical-align: middle;
        }
        
        footer {
            clear: both;
            padding: 0 0 10px;
            min-width: 1000px;
            border-top: 1px solid #dde3e6;
            background: #f8f8f8;
        }
        #formselect {
            width:200px;
            font-family:돋움; 
            font-style:normal; 
            color:#4C4D4B; 
            text-align:center; 
            background-color:#ffffff;
        }
        footer div {
            position: relative;
            margin: 0 auto;
            width: 1000px;
            text-align: center;
        }
        footer ul {
            margin: 0 0;
            text-align: center;
            padding: 15px 0 15px;
            border-bottom: 1px solid #dde3e6;
            zoom: 1;
        }
        footer li {
            display: inline-block;
            margin: 0 20px 0 0;
            font-size: 1.167em;
            font-weight: bold;
            zoom: 1;
            *display: inline;
        }
        footer a {
            text-decoration: none;
        }
        footer p {
            margin: 0;
            padding: 10px 0;
            line-height: 1.8em;
            border-top: 1px solid #fff;
            color: #555;
        }
        footer span {
            display: inline-block;
            margin: 0 15px 0 0;
        }
        footer b {
            display: inline-block;
            margin: 0 5px 0 0;
        }
    </style>
    <script>
        $(function(){
        	
        	$("#button2").click(function(){
        		
        		var url ="/idpwSearch.do";
        		window.open(url,"popup","width=400,height=300");
        		
        	});
        	
        	
            $("#button1").click(function(){
				var userid = $("#userid").val();
				var pass   = $("#pass").val();
				
				if(userid =="" || pass==""){
					alert("아이디 또는 암호를 입력해주세요.");
					return false;
				}
				var datas = {"userid":userid,"pass":pass};
				$.ajax({
					type : "POST",
					data : datas,
					url  : "/loginSession.do",
					
					datatype : "text",
					success  : function(data){
			            if(data !="" ) {
			               alert(data+"로그인되었습니다");
			               location="/";
			            } else {
			               alert("아이디 또는 암호가 일치하지 않습니다.");
			            } 
			         },
			         error : function(){
			            alert("전송실패");
			         }
					
				});
            });
        });
    </script>

</head>
<body>
    
    <header>
        <%@include file = "../include/header.jsp" %>
    </header>

    <div id="wrapper">
        <div id="container">
            <form style="margin: 0; padding: 0; border: 0;" name="frm">
                <section style="margin: 0 0 20px; padding: 20px 0;">
                 <div class="mbskin" id="mb_login">
                <h1>로그인</h1>
                    <fieldset id="login_fs">
                        <legend>회원로그인</legend>   <!-- 설명. 노출되지않음 -->
                        <label class="login_id" for="userid">회원아이디 필수</label>
                        <input autofocus class="frm_input required" id="userid" maxLength="20" name="userid" required size="20"
                               type="text">
                        <label class="login_pw" for="pass">비밀번호</label>
                        <input class="frm_input required" id="pass" maxLength="20" name="pass" required size="20"
                               type="password">
                        <input class="btn_submit" type="submit" value="로그인" id="button1" onclick="return false;">
                        <input id="login_auto_login" name="auto_login" type="checkbox">
                        <label for="login_auto_login">자동로그인</label>
                    </fieldset>
            
                    <aside id="login_info">
                        <h2>회원로그인 안내</h2>
                        <p>
                            회원아이디 및 비밀번호가 기억 안나실 때는 아이디/비밀번호 찾기를 이용하십시오.<br>
                            아직 회원이 아니시라면 회원으로 가입 후 이용해 주십시오.
                        </p>
                        <div>
                            <a class="btn02" id="button2" href="#">아이디 비밀번호 찾기</a>
                            <a class="btn01" id="button3" href="/mbrConditions.do">회원 가입</a>
                        </div>
                    </aside>
                <div style="text-align:center">
                    <a href="/">메인으로 돌아가기</a>
                </div>
            </div>
                </section>
               
            </form>
        </div>
    </div>

    <footer>
        <%@include file = "../include/footer.jsp" %>
    </footer>
</body>
</html>