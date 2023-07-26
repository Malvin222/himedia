<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/register.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
   <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    
</head>
<script>
$(function(){
   $("#userid").keyup(function(){
	   //6~12/중복아이디()
   	   var userid = $("#userid").val();
	   var msg = "";
	   if(userid.length <3 || userid.length > 20 ) {
		   msg ="<font color = 'red'>아이디는 3자리~20자리 사이로 입력해주세요</font>";
	   } else{
		   if(fn_userid(userid)=="1"){
			   msg ="<font color='green'>사용가능한 아이디입니다.</font>";
		   }else{
			   msg ="<font color='red'>이미사용중인 아이디입니다.</font>";
		   }
	   }
	   $("#msg_userid").html(msg);

   });
	
	
   $("#btn_submit").click(function(){
      
      var userid = $.trim($("#userid").val());
      var pass = $.trim($("#pass").val());
      var name = $.trim($("#name").val());
      $("#userid").val(userid);
      $("#pass").val(pass);
      $("#name").val(name);
      
      if (userid.length<3 || userid.length>20) {
         alert("아이디는 3~20자리 사이로 작성해주세요.");
         $("#userid").focus();
         return false;
      }
      
      if (pass.length<6 || pass.length>20) {
         alert("암호를 입력해주세요.");
         $("#pass").focus();
         return false;
      }
      
      if ( name== "") {
          alert("이름를 입력해주세요.");
          $("#name").focus();
          return false;
       }
      
      
      var form = $("#frm").serialize();
      $.ajax({
         
         type : "POST",
         url  : "/mbrJoinSave.do",
         data : form,

         datatype : "text",
         success  : function(data){
            if(data=="ok") {
               alert("저장완료");
               location="/loginWrite.do";
            } else {
               alert("저장실패!");
            }
         },
         error : function(){
            alert("전송실패");
         }
         
      });
      
   });
});

function fn_userid(userid){
	var result ="";
	$.ajax({
         
         type : "POST",
         url  : "/mbrUserIdCheck.do",
         data : "userid="+userid,
		 
         async : false,
         datatype : "text",
         success  : function(data){
        	 //1 : 사용가능 , 2 : 이미사용중
        	 result = data;
         },
         error : function(){
			alert("오류!");
			return "2";
         }
         
      });
      return result;
   }


</script>
<body>
    <header>
        <%@include file = "../include/header.jsp" %>
    </header>
    
    <div id="wrapper">
        
    <div id="container">
        <div id="wrapper_title">회원 가입</div>

        <div class="mbskin">

    
            <form id="frm" name="frm">
            <input type="hidden" name="w" value="">
            <input type="hidden" name="url" value="%2Fbbs%2Fregister_form.php">
            <input type="hidden" name="agree" value="1">
            <input type="hidden" name="agree2" value="1">
            <input type="hidden" name="cert_type" value="">
            <input type="hidden" name="cert_no" value="">
            <input type="hidden" name="mb_sex" value="">    
            <div class="tbl_frm01 tbl_wrap">
                <table>
                <caption>사이트 이용정보 입력</caption>
                <tbody>
                <tr>
                    <th scope="row"><label for="userid">아이디<strong class="sound_only">필수</strong></label></th>
                    <td>
                        
                        <input type="text" name="userid" value="" id="userid" required="" class="frm_input required " minlength="3" maxlength="20">
                        <span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
                        <span id="msg_userid"></span>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label for="pass">비밀번호<strong class="sound_only">필수</strong></label></th>
                    <td><input type="password" name="pass" id="pass" required="" class="frm_input required" minlength="3" maxlength="20"></td>
                </tr>
                <tr>
                    <th scope="row"><label for="pass2">비밀번호 확인<strong class="sound_only">필수</strong></label></th>
                    <td><input type="password" name="pass2" id="pass2" required="" class="frm_input required" minlength="3" maxlength="20"></td>
                </tr>
                </tbody>
                </table>
            </div>

            <div class="tbl_frm01 tbl_wrap">
                <table>
                <caption>개인정보 입력</caption>
                <tbody>
                    <tr>
                        <th scope="row"><label for="name">이름<strong class="sound_only">필수</strong></label></th>
                        <td>
                            <input type="text" id="name" name="name" value="" required="" class="frm_input required " size="10">
                        </td>
                    </tr>
                            <tr>
                        <th scope="row"><label for="nickname">닉네임<strong class="sound_only">필수</strong></label></th>
                        <td>
                            <input type="text" name="nickname" value="" id="nickname" required="" class="frm_input required nospace" size="10" maxlength="20">
                            <span class="frm_info">
                                공백없이 한글,영문,숫자만 입력 가능 (한글2자, 영문4자 이상)<br>
                                닉네임을 바꾸시면 앞으로 60일 이내에는 변경 할 수 없습니다.
                            </span>
                            
                            <input type="hidden" name="mb_nick_default" value="">
                            <span id="msg_userid"></span>
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row"><label for="email">E-mail<strong class="sound_only">필수</strong></label></th>
                        <td>
                            <input type="text" name="email" value="" id="email" required="" class="frm_input email required" size="70" maxlength="100">
                        </td>
                    </tr>

                    
                            <tr>
                        <th scope="row"><label for="phone">전화번호</label></th>
                        <td><input type="text" name="phone" value="" id="phone" class="frm_input " maxlength="20"></td>
                    </tr>
                    
                    <tr>
                        <th scope="row"><label for="mobile">휴대폰번호<strong class="sound_only">필수</strong></label></th>
                        <td>
                            <input type="text" name="mobile" value="" id="mobile" required="" class="frm_input required" maxlength="20">
                        </td>
                    </tr>
                
                </tbody>
            </table>
        </div>

        <div class="tbl_frm01 tbl_wrap">
            <table>
            <caption>기타 개인설정</caption>
            <tbody>
            
            
            
            <tr>
                <th scope="row"><label for="mail">메일링서비스</label></th>
                <td>
                    <input type="checkbox" name="mail" value="Y" id="mail" checked="">
                    정보 메일을 받겠습니다.
                </td>
            </tr>

                    <tr>
                <th scope="row"><label for="sms">SMS 수신여부</label></th>
                <td>
                    <input type="checkbox" name="sms" value="Y" id="sms" checked="">
                    휴대폰 문자메세지를 받겠습니다.
                </td>
            </tr>
            
                    <tr>
                <th scope="row"><label for="reg_mb_open">정보공개</label></th>
                <td>
                    <span class="frm_info">
                        정보공개를 바꾸시면 앞으로 0일 이내에는 변경이 안됩니다.
                    </span>
                    <input type="hidden" name="mb_open_default" value="">
                    <input type="checkbox" name="mb_open" value="1" checked="" id="reg_mb_open">
                    다른분들이 나의 정보를 볼 수 있도록 합니다.
                </td>
            </tr>
            
            
            <tr>
                <th scope="row">자동등록방지</th>
                    <td>
                        <fieldset id="captcha" class="captcha">
                        <legend><label for="captcha_key">자동등록방지</label></legend>
                        <img src="../images/kcaptcha_image.jpg" alt="" id="captcha_img">
                        <button type="button" id="captcha_mp3"><span></span>숫자음성듣기</button>
                        <button type="button" id="captcha_reload"><span></span>새로고침</button><input type="text" name="captcha_key" id="captcha_key" required="" class="captcha_box required" size="6" maxlength="6">
                        <span id="captcha_info">자동등록방지 숫자를 순서대로 입력하세요.</span>
                        </fieldset>
                    </td>
            </tr>
                    </tbody>
                    </table>
        </div>

        <div class="btn_confirm">
            <input type="submit" value="회원가입" id="btn_submit" onclick="return false;" class="btn_submit" accesskey="s">
            <a href="" class="btn_cancel">취소</a>
        </div>
        </form>

        </div>

    </div>
</div>
<footer>
    <%@include file = "../include/footer.jsp" %>
</footer>
</body>
</html>