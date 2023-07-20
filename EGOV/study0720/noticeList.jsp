<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>공지사항</title>
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
    <header>
        <div id= "hd" style="z-index: 1000; margin: 0 auto;">
            <div style="width: 100%; background-color: #f9f9f9; border-bottom: #ddd 1px solid;">
                <div style="width: 1000px; margin:0 auto; height: 35px; line-height: 35px;">
                    <ul style="float: left;">
                        <li class="li_style"><a class="li_left_style" href ="../main/main.html" style="padding: 0 20px; display: inline; font-size: 11px;"> HOME </a></li>
                        <li class="li_style"><a class="li_left_style" href="">즐겨찾기 </a></li>
                    </ul>

                    <ul style='float:right;'>
                        <li class="li_style"><a class="a_li_style" href="../member/registerToS.html">회원가입</a></li>
                        <li class="li_style"><a class="a_li_style" href="../member/login.html"><b>로그인</b></a></li>
                        <li class="li_style"><a class="a_li_style" href="../member/MyPage.html">마이페이지</a></li>
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
                        <img src="../images/call_center.jpg" alt="고객센터 : 012-777-7777">
                    </div>

                    <div id="hd_wrapper_main_title">
                        <a href="../main/main.html"> <img src="../images/logo_img.jpg" alt="제주렌트카"> </a>
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


    <div id = "wrapper">

        <div id="container">
            <section class="sct_wrap">
                <header >
                    <a href="">
                        <h3 style="letter-spacing:-0.06em; font-size:15px; margin:30px 0 10px 0;">
                            공지사항
                        </h3>
                    </a>
                </header>

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
            </section>

            <footer>
                <div>
                    <ul>
                        <li><a href="">회사소개</a></li>
                        <li><a href="">전자상거래표준약관</a></li>
                        <li><a href="">개인정보 취급방침</a></li>
                        <li><a href="">국내여행표준약관</a></li>
                        <li>
                            <select size="1" id="formselect" name="select4" class="top">
                                <option selected>::::제휴사이트 링크::::</option>
                                <option>-----------------------</option>
                                <option value="">제주허브닷컴</option>
                                <option value="">제주허브렌트카</option>
                                <option value="">제주렌트카닷컴</option>
                            </select></li>
                    </ul>
                    <p>
                        <span><b>회사명</b> 제주렌트카 (상호명:제주허브닷컴)</span>
                        <span><b>주소</b> 제주특별자치도 제주시 평전길13 (1층, 삼도1동)</span><br>
                        <span><b>사업자 등록번호</b> 616-27-75958</span>
                        <span><b>대표</b> 조영민</span>
                        <span><b>전화</b> 064-747-6606</span>
                        <span><b>팩스</b> 064-803-0843</span><br>
                        <span><b>통신판매업신고번호</b> 제2020-삼도1동-0032호</span>
                        <span><b>개인정보관리책임자</b> 조영민</span>
                        <span><b>부가통신사업신고번호</b> 제2011-46호</span><br>
                        <span class="copy">Copyright © 2016-2020 제주렌트카 (상호명:제주허브닷컴). All Rights Reserved.</span>
                    </p>
                </div>

            </footer>
        </div>
    </div>
</body>
</html>