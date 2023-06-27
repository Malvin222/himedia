<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@include file = "../include/oracleCon.jsp" %>
<!-- 세션ID값 가져옴 -->
<% 
String userid =(String)session.getAttribute("SessionUserId");
if(userid ==null){
%>
	<script>
		alert("로그인해주세요");
		location="../member/loginWrite.jsp";
	</script>
<%
}
%>
<!-- SQL -->
<%
String sql ="select userid "
			+" ,name "
			+" ,gender "
			+" ,to_char(birthday,'yyyy-mm-dd') birthday "
			+" ,phone "
			+" ,zipcode "
			+" ,addr "
			+" ,hobby "
			+" ,email "
			+" ,homepage "
			+" from memberinfo "
			+" where userid='"+userid+"'";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
if(rs.next()==false){
	session.removeAttribute("SessionUserId");
%>
	<Script>
	alert("다시 로그인을 해주세요.");
	location="../member/loginWrite.jsp";
	</Script>
<%
	return;
}
String id 		= rs.getString("userid");
String name 	= rs.getString("name");
String gender 	= rs.getString("gender");
String birthday = rs.getString("birthday");
String phone 	= rs.getString("phone");
String zipcode 	= rs.getString("zipcode");
String addr 	= rs.getString("addr");
String hobby 	= rs.getString("hobby");
String email 	= rs.getString("email");
String homepage = rs.getString("homepage");

//b_array[0] ="2021"; b_array[1] = "5";
String[] b_array = birthday.split("-");
int b_year = Integer.parseInt(b_array[0]);
int b_month = Integer.parseInt(b_array[1]);
int b_day = Integer.parseInt(b_array[2]);


String[] p_array = phone.split("-");

String[] pp = new String[3];
pp[0] = p_array[0];
pp[1] = p_array[1];
pp[2] = p_array[2];
for( int i=0; i<p_array.length; i++ ) {
   pp[i] = p_array[i];
}

//취미세팅
//hobby = "바둑,체스";
//if (hobby.indexOf("바둑") >-1 )
String[] h_array = hobby.split(",");


%>
<!DOCTYPE html>
 <head>
  <meta charset="UTF-8">
  <title>회원정보수정화면</title>
<link rel="stylesheet" href="../css/layout.css">
</head>
<style>
td{ text-align:left; }
.input1 { width:98%; }
.input2 { width:150px; }
</style>

<script>
function fn_popup(){
	var url = "post1.jsp";
	window.open(url,"post","width=500,height=200");	
}

function fn_submit(){
	var f =document.frm;
	if( f.userid.value.length<6 || 
			f.userid.value.length>12) {
			alert("아이디는 6자리 ~ 12자리 사이로 작성해주세요.");
			f.userid.focus();
			return false;
	}
	if( f.userpw.value.length<6 || 
			f.userpw.value.length>20) {
			alert("암호는 6자리 ~ 20자리 사이로 작성해주세요.");
			f.userpw.focus();
			return false;
	}
	if(f.name.value==""){
		alert("이름을 입력해주세요.");
		f.name.focus();
		return false;
	}
	if( f.p2.value =="" || f.p3.value ==""){
		alert("핸드폰번호를 입력해주세요.");
		f.p2.focus();
		return false;
	}
	var hobby = document.getElementsByName("hobby");
	var len = hobby.length;
	var cnt = 0;
	for( var i=0;i<len;i++){
		if(hobby[i].checked==true){
			cnt++;
		}
	}
	if(cnt ==0){
		alert("취미를 선택해주세요.");
		return false;
	}
	
	f.submit();
	
}

</script>

<body>
<div class="wrap">
    <header>
		<div class="top_header">
		</div>
    </header>
    <nav>
	 	<div class="nav_left_space">&nbsp;</div>
		<div class="nav_center_space"> 
		<%@ include file="../include/navmenu.jsp" %>
		</div>
		<div class="nav_right_space">&nbsp;</div>
    </nav>
	<aside>
		<!-- aside S -->
		<%@ include file="../include/aside.jsp" %>
		<!-- aside E -->
	</aside>
    <section>
    <article>
    <!-- 본문 START  -->
    <form name="frm" method="post" action="memberModifySave.jsp">
    <table>
    	<tr>
    		<th>*아이디</th>
    		<td>
    		<%=id%>
    		</td>
    	</tr>
    	<tr>
    		<th>*암호</th>
    		<td><button type="button">암호변경</button></td>
    	</tr>
    	<tr>
    		<th>*이름</th>
    		<td><input type="text" name="name" class="input1;" value="<%=name%>"></td>
    	</tr>
    	<tr>
    		<th>*성별</th>
    		<td>
    		<select name="gender">
    			<option value="M" <%if(gender.equals("M")) {out.print("selected");} %>>남성</option>	
    			<option value="F" <%if(gender.equals("F")) {out.print("selected");} %>>여성</option>	
    		</select>
    		</td>
    	</tr>
    	<tr>
    		<th>*생일</th>
    		<td>	<!-- 1940 ~ 2022 -->
	    		<select name="year">
    			<%
    			for(int yy=1940;yy<=2022;yy++){
    			%>
	    			<option value="<%=yy%>" <%if(yy==b_year) {%>selected <%} %>  ><%=yy %>년</option>	
	    		<%
	    		}
    			%>
	    		</select>
	    		<select name="month">
	    		<%
	    		for(int mm=1;mm<=12;mm++){
	    		%>
	    			<option value="<%=mm%>" <%if(mm==b_month) {%>selected <%} %>  ><%=mm %>월</option>	
	    		<%
	    		}
	    		%>
	    		</select>
	    		<select name="day">
	    		<%
	    		for(int dd=1;dd<=31;dd++){
	    		%>
	    			<option value="<%=dd%>" <%if(dd==b_day) {%>selected <%} %>  ><%=dd %>일</option>	
	    		<%
	    		}
	    		%>
	    		</select>
    		</td>
    	</tr>
    	<tr>
    		<th>*핸드폰</th>
    		<td>
    			<select name="p1">
    				<option value="010" <%if(pp[0].equals("010")){out.print("selected");} %>>010</option>
    				<option value="011"<%if(pp[0].equals("011")){out.print("selected");} %>>011</option>
    				<option value="015" <%if(pp[0].equals("015")){out.print("selected");} %>>015</option>
    			</select>
    			<input type="number" name="p2" class="input2" 
    					value="<%=pp[1]%>">
    			<input type="number" name="p3" class="input2" 
    					value="<%=( (pp[2]==null)?"":pp[2]) %>">
    		</td>
    	</tr>
    	<tr>
    		<th>주소</th>
    		<td>
    		<div style="line-height:2.0;">
    		<input type="number" name="zipcode" class="input2" maxlength ="6" value="<%=zipcode%>">
    		<button type="button" onclick="fn_popup()">우편번호찾기</button>
    		<br>
      		<input type="text" name="addr" class="input1" value="<%=addr%>">
    		</div>
    		</td>
    	</tr>
    	<tr>
    		<th>취미</th>
    		<td>
    		<input type="checkbox" name="hobby" value="바둑" 
    		<%if(hobby.indexOf("바둑") > -1) {out.print("checked");} %> >바둑
    		<input type="checkbox" name="hobby" value="장기"
    		<%if(hobby.indexOf("장기") > -1) {out.print("checked");} %> >장기
    		<input type="checkbox" name="hobby" value="체스" 
    		<%if(hobby.indexOf("체스") > -1) {out.print("checked");} %> >체스		
    		
    		</td>
    	</tr>
    	<tr>
    		<th>이메일</th>
    		<td><input type="text" name="email" class="input1" value="<%=email%>"></td>
    	</tr>
    	<tr>
    		<th>홈페이지</th>
    		<td><input type="url" name="homepage" class="input1" value="<%=homepage%>"></td>
    	</tr>

    </table>
    <div style="width:600px; 
    			text-align:center; 
    			margin-top:10px;">
    	<button type="submit" onclick="fn_submit();return false;">수정</button>
    	<button type="reset">취소</button>
    </div>
    </form>
    <!-- 본문 END  -->
     </article>
    </section>
    <footer>
	<!-- footer S -->
		<%@ include file="../include/footer.jsp" %>
	<!-- footer E -->
    </footer>
</div>
</body>
</html>

