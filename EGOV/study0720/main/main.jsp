<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><link rel="stylesheet" href="../css/main.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Document</title>
</head>
<body>
    <header>
        <%@ include file="../include/header.jsp" %>
    </header>


    <div id = "wrapper">

        <div id="container">
            <section class="sct_wrap">
                <header >
                    <a href="">
                        <h1 style="letter-spacing:-0.06em; font-size:24px; margin:30px 0 10px 0;">
                            <strong style="color:#2fac23;">최신형 할인</strong> 
                            <span>렌트카</span>
                            <span style="font-size:12px; font-weight:normal; margin-left:10px; padding-left:10px; color:#777; border-left:#ccc 1px solid; letter-spacing:normal;">고객님을 위해 추천해드리는 신규 할인 렌트카</span>
                            <button type="button" data-role="none" class="slick-prev slick-arrow" aria-label="Previous" role="button" style="display: block;">◀</button>
                            <button type="button" data-role="none" class="slick-next slick-arrow" aria-label="Next" role="button" style="display: block;">▶</button>
                        </h1>
                    </a>
                </header>

                <div class="slick-list">
                    <ul style="opacity: 1; width: 1708px;" id="">
                        <li class="sct_li  slick-slide" style="width: 244px;">
                            <div class="sct_img">
                                <img src="../images/car_1.jpg" width="210" height="210">
                            </div>
                            <div class="sct_txt">
                                <a href="" class="sct_a" tabindex="-1">
                                    올뉴K7 + 고급자차
                                    </a>
                            </div>
                            <div class="sct_cost">
                                <strike>220,000원</strike>
                                110,000원
                            </div>
                        </li>
                        <li class="sct_li  slick-slide" style="width: 244px;">
                            <div class="sct_img">
                                <img src="../images/car_2.jpg" width="210" height="210">
                            </div>
                            <div class="sct_txt">
                                <a href="" class="sct_a" tabindex="-1">
                                    소나타 + 고급자차
                                    </a>
                            </div>
                            <div class="sct_cost">
                                <strike>123,000원</strike>
                                87,000원
                            </div>
                        </li>
                        <li class="sct_li  slick-slide" style="width: 244px;">
                            <div class="sct_img">
                                <img src="../images/car_3.jpg" width="210" height="210">
                            </div>
                            <div class="sct_txt">
                                <a href="" class="sct_a" tabindex="-1">
                                    그렌져 + 고급자차
                                    </a>
                            </div>
                            <div class="sct_cost">
                                <strike>324,000원</strike>
                                152,000원
                            </div>
                        </li>
                        <li class="sct_li  slick-slide" style="width: 244px;">
                            <div class="sct_img">
                                <img src="../images/car_4.jpg" width="210" height="210">
                            </div>
                            <div class="sct_txt">
                                <a href="" class="sct_a" tabindex="-1">
                                    SUV + 고급자차
                                    </a>
                            </div>
                            <div class="sct_cost">
                                <strike>999,000원</strike>
                                444,000원
                            </div>
                        </li>
                    </ul>
                </div>
            </section>

            <section>
                <div class="lt_list">
                    <div class="lt_qa">
                        
                <div class="lat">
                    <h2 class="lat_title" ><a href="">예약상담</a></h2>
                    <ul>
                            <li>
                            <a href="">안녕하세요</a><span class="lt_date">08-29</span>
                        </li>
                            <li>
                            <a href="">Re: 안녕하세요</a><span class="lt_date">09-01</span>
                        </li>
                            <li>
                            <a href="">결제</a><span class="lt_date">04-13</span>
                        </li>
                            <li>
                            <a href="">Re: 결제</a><span class="lt_date">04-14</span>
                        </li>
                            <li>
                            <a href="">예약했어요</a><span class="lt_date">12-03</span>
                        </li>
                            </ul>
                    <div class="lat_more"><a href=""><span class="sound_only">예약상담</span>더보기</a></div>
                </div>
                    </div>
                    <div class="lt_notice">
                        
                <div class="lat">
                    <h2 class="lat_title"><a href="">공지사항</a></h2>
                    <ul>
                            <li>
                            <a href="">2021년도 여름 성수기 [제주도…</a><span class="lt_date">06-07</span>
                        </li>
                            <li>
                            <a href="">여름성수기 제주도렌트카 예약 오픈…</a><span class="lt_date">06-03</span>
                        </li>
                            <li>
                            <a href=""><strong>신용카드 이용내역 조회</strong></a><span class="lt_date">04-02</span>
                        </li>
                            <li>
                            <a href="">제네시스GV80 7인승 / K7프…</a><span class="lt_date">03-19</span>
                        </li>
                            <li>
                            <a href="">★ 이달의 특가차량 ☆ 판매시작</a><span class="lt_date">03-04</span>
                        </li>
                            </ul>
                    <div class="lat_more"><a href=""><span class="sound_only">공지사항</span>더보기</a></div>
                </div>
                    </div>
                    <div class="lt_tel">
                        <img src="../images/cs_center.jpg" alt="고객센터 Tel. 064)747-6606">
                    </div>
            </section>

            <footer>
               <%@ include file="../include/footer.jsp" %>
            </footer>
        </div>
    </div>
</body>
</html>