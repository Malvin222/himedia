<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
   <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
        /*function check(){
            const checkbox = document.querySelectorAll('.checkbox');
            for(var i = 0 ; i < checkbox.length; i ++){
                if(checkbox[i].checked == false){
                    alert("약관에 동의하셔야합니다.");
                    checkbox.focus();
                    return false;
                }
            }
            document.frm.submit();
            location = "../member/register.html";
        }*/
        $(function(){
            // 동의 전체 체크 박스 클릭 시 모든 동의 체크박스 상태 변경
            $("#agree_all").click(function(){
                var len = $("input[name='agree']").length;       
                var bool = $(this).is(":checked");
                for(var i = 0; i < len; i++){
                    $("input[name='agree']")[i].checked = bool;
                }
            });
            
            // "회원가입" 버튼 클릭 시 모든 동의 체크박스가 체크되었는지 확인 후 이동
            $("#button1").click(function(){
                var len = $("input[name='agree']").length;
                var bool = true;
                for(var i = 0; i < len; i++){
                    if(!$("input[name='agree']")[i].checked){
                        bool = false;
                        break;
                    }
                }
                if(!bool){
                    alert("약관에 모두 동의해주세요.");
                    return false;
                }
                location = "/mbrJoinWrite.do";
            });
        });
    </script>

</head>
<body>
    
    <header>
 
 <%@ include file="../include/header.jsp" %>
 
    </header>

    <div id="wrapper">

        <div id="container">
            <div style="margin-bottom: 15px; font-size: 1.3em; font-weight: bold;">
                회원가입약관
            </div>
            <form style="margin: 0; padding: 0; border: 0;" name="frm">
                <p style="color: #e8180c; text-align: center;">회원가입약관 및 개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.</p>
                
                <section style="margin: 0 0 20px; padding: 20px 0;">
                    <h2 style="margin: 0 0 20px; text-align: center; font-size: 1em;">회원가입약관</h2>  
                
                <textarea readonly id="chapter_1">
               <%@ include file="../include/condition1.jsp" %>
            </textarea>

                    <fieldset  style="padding: 10px 0 0; text-align: right;">
                        <label for="agree11">회원가입약관의 내용에 동의합니다.</label>
                        <input type="checkbox" name="agree" class="checkbox">
                    </fieldset>
                </section>
                
                <section style="margin: 0 0 20px; padding: 20px 0;">
                    <h2 style="margin: 0 0 20px; text-align: center; font-size: 1em;">개인정보처리방침안내</h2>  
                    
                    <textarea readonly id="chapter_2">
               <%@ include file="../include/condition2.jsp" %>
               </textarea>
               
                    <fieldset class="fregister_agree" style="padding: 10px 0 0; text-align: right;">
                        <label for="agree21">개인정보처리방침안내의 내용에 동의합니다.</label>
                        <input type="checkbox" name="agree" id="agree21" class="checkbox">
                    </fieldset>
                    
                    <fieldset class="fregister_agree" style="padding: 10px 0 0; text-align: right;">
                        <label for="agree21">모두 동의합니다.</label>
                        <input type="checkbox" name="agree_all" id="agree_all" class="checkbox">
                    </fieldset>
                    
                </section>
                <div style="text-align: center;">
                    <input type="submit" class="btn_submit" id="button1" onclick="return false;" value="회원가입" style="cursor: pointer;">
                </div>
    
            </form>
        </div>
    </div>

    <footer>

<%@ include file="../include/footer.jsp" %>

    </footer>
</body>
</html>


