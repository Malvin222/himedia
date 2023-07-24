<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/main.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Document</title>
</head>

<style>
.page_number_area {
   width:100%;
   text-align:center;
   padding-top:20px;
}   
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
       <%@include file = "../include/header.jsp" %>
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
                <table border="0" width="1000" align="center">
               <tr><td align="left"> Total : ${total } </td></tr>
            </table>

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
               <c:set var = "rownumber" value="${vo.recordCountPerPage}"/>
               <c:forEach var="list" items="${resultList}" varStatus="status">
                  <tr>
                     <td>
                        <c:if test="${list.emps=='Y' }">공지</c:if>
                        <c:if test="${list.emps=='N' }">${rownumber}</c:if>
                     </td>
                     <td style="text-align:left;"><a href="adminNoticeDetail.do?unq=${list.unq}">${list.title}</a></td>
                     <td>${list.name}</td>
                     <td>${list.rdate}</td>
                     <td>${list.hits}</td>
                  </tr>
                  <c:set var = "rownumber" value="${rownumber-1 }"/>
               
               </c:forEach>
            </table>
            <div class="page_number_area">
               <c:forEach var="i" begin="1" end="${vo.lastPage }">
                  <a href="/noticeList.do?pageIndex=${i }">${i }</a>
               </c:forEach>
            </div>
                </div>
            </section>

            <footer>
            <%@include file = "../include/footer.jsp" %>
            </footer>
        </div>
    </div>
</body>
</html>