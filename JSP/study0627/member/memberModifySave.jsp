<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>
<!-- 파라메터 값 설정 -->
<%
	
	String userid = (String) session.getAttribute("SessionUserId");
	String userpw = request.getParameter("userpw");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String p1 = request.getParameter("p1");
	String p2 = request.getParameter("p2");
	String p3 = request.getParameter("p3");
	String zipcode = request.getParameter("zipcode");
	String addr = request.getParameter("addr");
	String[] hobby = request.getParameterValues("hobby");
	String email = request.getParameter("email");
	String homepage = request.getParameter("homepage");
	
	String birthday = year+"-"+month+"-"+day;
	String phone = p1+"-"+p2+"-"+p3;
	String hobby1 = "";
	for(int i=0; i<hobby.length;i++){
		hobby1 += hobby[i]+",";
	}
	hobby1 =hobby1.substring(0,hobby1.length()-1);
%>

<!-- 중요 데이터 값의 널값 체크 아이디/암호/이름 -->

<!-- 데이터 저장 -->		
<% String sql2 = " update memberinfo set  "
				 +" name='"+name+"', "
				 +" gender='"+gender+"', "
				 +" birthday='"+birthday+"', "
				 +" phone='"+phone+"', "
				 +" zipcode='"+zipcode+"', "
				 +" addr='"+addr+"', "
				 +" email='"+email+"', "
				 +" homepage='"+homepage+"', "
				 +" hobby='"+hobby1+"' "
				 +" where userid='"+userid+"'";
Statement stmt2 = con.createStatement();
int result = stmt2.executeUpdate(sql2); 
%>
<!-- 메세지 출력 -->
<%
if(result ==1){
%>
<script>
	alert("변경 완료")
	location="../main/main.jsp";
</script>
<%
}else{
%>
<script>
	alert("변경 실패")
	history.back();
</script>
<% 
}
%>