<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>
<!-- 파라메터 값 설정 -->
<%
	String userid = request.getParameter("userid");
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
<%
	if (userid == null ||userpw== null || name ==null){
%>
	<script>
		alert("잘못된 경로로의 접근입니다.");
		self.close
	</script>	
<%
}
%>
<!-- 아이디 중복체크 -->
	
<% 
	String ptn1 ="^[0-9a-zA-Z]{1}[0-9a-zA-Z_-]{5,11}";
	boolean chk1 =userid.matches(ptn1);
	if(chk1==false){
%>
	<Script>
		alert("영문또는 숫자로 이루어진 6자~12자");
		history.go(-1);
	</Script>
<%
} 
%>
<% 
String sql1 = "select count(*) cnt from memberinfo where userid='"+userid+"'";
Statement stmt1 = con.createStatement();
ResultSet rs1 =stmt1.executeQuery(sql1);
rs1.next();
int cnt = rs1.getInt("cnt");
if(cnt>0){
%>
	<script>
		alert("중복된 아이디가 존재합니다.");
		history.back();
	</script>
<%
return;
}
%>
<!-- 데이터 저장 -->
<%
	String sql2 ="insert into memberinfo ( "
				+" unq "
				+" ,userid "
				+" ,userpw "
				+" ,name "
				+" ,gender "
				+" ,birthday "
				+" ,phone "
				+" ,zipcode "
				+" ,addr "
				+" ,hobby "
				+" ,email "
				+" ,homepage "
				+" ,rdate) "
				+" values(memberinfo_seq.nextval "
				+"		,'"+userid+"' "
				+"		,'"+userpw+"' "
				+"		,'"+name+"' "
				+"		,'"+gender+"' "
				+"		,'"+birthday+"' "
				+"		,'"+phone+"' "
				+"		,'"+zipcode+"' "
				+"		,'"+addr+"' "
				+"		,'"+hobby1+"' "
				+"		,'"+email+"' "
				+"		,'"+homepage+"' "
				+"		,sysdate)";
	Statement stmt2 = con.createStatement();
	int result2 = stmt2.executeUpdate(sql2);

	if(result2 ==1){
%>
	<Script>
		alert("화원가입 완료");
		location="../main/main.jsp"
	</Script>
<%
	}else{
%>
	<Script>
		alert("회원가입 실패");
		history.back();
	</Script>
<%
	return;
	}
%>
