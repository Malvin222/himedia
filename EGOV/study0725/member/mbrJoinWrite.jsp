<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/register.css">
</head>
<body>
    <header>
        <div id= "hd" style="z-index: 1000; margin: 0 auto;">
            <div style="width: 100%; background-color: #f9f9f9; border-bottom: #ddd 1px solid;">
                <div style="width: 1000px; margin:0 auto; height: 35px; line-height: 35px;">
                    <ul style="float: left;">
                        <li class="li_style"><a class="li_left_style" href ="index.html"> HOME </a></li>
                        <li class="li_style"><a class="li_left_style" href="">즐겨찾기 </a></li>
                    </ul>

                    <ul style='float:right;'>
                        <li class="li_style"><a class="a_li_style" href="registerToS.html">회원가입</a></li>
                        <li class="li_style"><a class="a_li_style" href="login.html"><b>로그인</b></a></li>
                        <li class="li_style"><a class="a_li_style" href="MyPage.html">마이페이지</a></li>
                        <li class="li_style"><a class="a_li_style" href="">예약조회</a></li>
                        <li class="li_style"><a class="a_li_style" href="">공지사항</a></li>
                        <li class="li_style"><a class="a_li_style" href=""><b>예약상담</b></a></li>
                        <li class="li_style"><a class="a_li_style" href=""><b>이용후기</b></a></li>
                        <li class="li_style"><a class="a_li_style3" href="">개인결제</a></li>   
                    </ul>
                </div>
            </div>

            <div id="hd_wrapper">
                <div style="width: 100%; height: 80px;">

                    <div id="hd_wrapper_call_div">
                        <img src="../images/call_center.jpg" alt="고객센터 : 012-345-6789">
                    </div>

                    <div id="hd_wrapper_main_title">
                        <a href="index.html"> <img src="../images/logo_img.jpg" alt="제주렌트카"> </a>
                    </div>

                    <div id="hd_wrapper_kakao">
                        <img src="../images/yellowid.png" alt="카카오톡">
                    </div>

                </div>

            </div>

            <div id="rentlist_left" >
                <div id="rentlist_right">
                    <nav id="gnb">
                        <h2>쇼핑몰 카테고리</h2>

                        <ul id="gnb_1dul" >
                            <li class="gnb_1dli">
                                <a href="" class="gnb_2da"> <font color = #FFF000>★ 전체차량 리스트 ☆</font></a>
                            </li>
                            <li class="gnb_1dli" style="z-index:998">
                                <a href="" class="gnb_1da">경.소형차량</a>
                            </li>
                            <li class="gnb_1dli" style="z-index:997">
                                <a href="" class="gnb_1da">중형차량</a>
                            </li>
                            <li class="gnb_1dli" style="z-index:996">
                                <a href="" class="gnb_1da">고급차량</a>
                            </li>
                            <li class="gnb_1dli" style="z-index:995">
                                <a href="" class="gnb_1da">SUV / RV</a>
                            </li>
                            <li class="gnb_1dli" style="z-index:994">
                                <a href="" class="gnb_1da">승합차량</a>
                            </li>
                            <li class="gnb_1dli" style="z-index:993">
                                <a href="" class="gnb_1da">외제차량</a>
                            </li>
                        </ul>

                        <ul class="gnb_co">
                            <li class="bg_no"><b><font color='#ffff00'><a href="" class="gnb_2da">기사전용차량</a></font></b></li>
                            <li><a href="">실시간항공권</a></li>
                            <li><a href="">관광지할인쿠폰</a></li>
                        </ul>

                    </nav>
                </div>
            </div>
        </div>
    </header>
    
    <div id="wrapper">
        
    <div id="container">
        <div id="wrapper_title">회원 가입</div>

        <div class="mbskin">

    
            <form id="fregisterform" name="fregisterform" action="" method="post">
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
                    <th scope="row"><label for="reg_mb_id">아이디<strong class="sound_only">필수</strong></label></th>
                    <td>
                        <span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
                        <input type="text" name="mb_id" value="" id="reg_mb_id" required="" class="frm_input required " minlength="3" maxlength="20">
                        <span id="msg_mb_id"></span>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label for="reg_mb_password">비밀번호<strong class="sound_only">필수</strong></label></th>
                    <td><input type="password" name="mb_password" id="reg_mb_password" required="" class="frm_input required" minlength="3" maxlength="20"></td>
                </tr>
                <tr>
                    <th scope="row"><label for="reg_mb_password_re">비밀번호 확인<strong class="sound_only">필수</strong></label></th>
                    <td><input type="password" name="mb_password_re" id="reg_mb_password_re" required="" class="frm_input required" minlength="3" maxlength="20"></td>
                </tr>
                </tbody>
                </table>
            </div>

            <div class="tbl_frm01 tbl_wrap">
                <table>
                <caption>개인정보 입력</caption>
                <tbody>
                    <tr>
                        <th scope="row"><label for="reg_mb_name">이름<strong class="sound_only">필수</strong></label></th>
                        <td>
                            <input type="text" id="reg_mb_name" name="mb_name" value="" required="" class="frm_input required " size="10">
                        </td>
                    </tr>
                            <tr>
                        <th scope="row"><label for="reg_mb_nick">닉네임<strong class="sound_only">필수</strong></label></th>
                        <td>
                            <span class="frm_info">
                                공백없이 한글,영문,숫자만 입력 가능 (한글2자, 영문4자 이상)<br>
                                닉네임을 바꾸시면 앞으로 60일 이내에는 변경 할 수 없습니다.
                            </span>
                            <input type="hidden" name="mb_nick_default" value="">
                            <input type="text" name="mb_nick" value="" id="reg_mb_nick" required="" class="frm_input required nospace" size="10" maxlength="20">
                            <span id="msg_mb_nick"></span>
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row"><label for="reg_mb_email">E-mail<strong class="sound_only">필수</strong></label></th>
                        <td>
                            <input type="hidden" name="old_email" value="">
                            <input type="text" name="mb_email" value="" id="reg_mb_email" required="" class="frm_input email required" size="70" maxlength="100">
                        </td>
                    </tr>

                    
                            <tr>
                        <th scope="row"><label for="reg_mb_tel">전화번호</label></th>
                        <td><input type="text" name="mb_tel" value="" id="reg_mb_tel" class="frm_input " maxlength="20"></td>
                    </tr>
                    
                    <tr>
                        <th scope="row"><label for="reg_mb_hp">휴대폰번호<strong class="sound_only">필수</strong></label></th>
                        <td>
                            <input type="text" name="mb_hp" value="" id="reg_mb_hp" required="" class="frm_input required" maxlength="20">
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
                <th scope="row"><label for="reg_mb_mailling">메일링서비스</label></th>
                <td>
                    <input type="checkbox" name="mb_mailling" value="1" id="reg_mb_mailling" checked="">
                    정보 메일을 받겠습니다.
                </td>
            </tr>

                    <tr>
                <th scope="row"><label for="reg_mb_sms">SMS 수신여부</label></th>
                <td>
                    <input type="checkbox" name="mb_sms" value="1" id="reg_mb_sms" checked="">
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
            <input type="submit" value="회원가입" id="btn_submit" class="btn_submit" accesskey="s">
            <a href="" class="btn_cancel">취소</a>
        </div>
        </form>

        </div>

    </div>
    </div>
</body>
</html>