<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

나의 IP = <%= request.getRemoteAddr() %><br>
데이터길이= <%= request.getContentLength() %><br>
인코딩 =<%= request.getCharacterEncoding() %><br>
컨텐츠타입( ) = <%=request.getContentType() %><br>
프로토콜(웹브라우저) = <%= request.getProtocol() %><br>
전송방식 = <%= request.getMethod() %><br>
URL(활성화되어있는 브라우저 웹주소) = <%= request.getRequestURI() %><br>
컨텍스트 경로(프로젝트 이름) =<%= request.getContextPath() %><br>
서버 이름 = <%= request.getServerName() %><br>
서버 포트 =<%= request.getServerPort() %>
