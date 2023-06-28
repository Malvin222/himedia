<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
 <head>
  <meta charset="UTF-8">
  <title>회원등록화면</title>
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

function fn_idcheck() {
	
	var id = document.frm.userid.value;
	while(true){
		id = id.replace(" ","");	
		if(id.indexOf(" ")== -1) {	
			break;	
		}
	}
	
	document.frm.userid.value = id;
	if(id.length < 6 || id.length>12){
		alert("아이디는 6~12자로 입력해주세요");
		return false;
	}
	
	var url = "id_check_pop.jsp?userid="+id;
	window.open(url,"id_check","width=400,height=300");
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
		<%@include file="../include/navmenu.jsp" %>
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
    <form name="frm" method="post" action="memberWriteSave.jsp">
    <table>
    	<tr>
    		<th>*아이디</th>
    		<td>
    		<input type="text" name="userid">
    		<button type="button" onclick="fn_idcheck()">중복체크</button>
    		</td>
    	</tr>
    	<tr>
    		<th>*암호</th>
    		<td><input type="password" name="userpw" class="input1"></td>
    	</tr>
    	<tr>
    		<th>*이름</th>
    		<td><input type="text" name="name" class="input1;"></td>
    	</tr>
    	<tr>
    		<th>*성별</th>
    		<td>
    		<select name="gender">
    			<option value="M">남성</option>	
    			<option value="F">여성</option>	
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
	    			<option value="<%=yy%>" <%if(yy==2000) {%>selected <%} %>  ><%=yy %>년</option>	
	    		<%
	    		}
    			%>
	    		</select>
	    		<select name="month">
	    		<%
	    		for(int mm=1;mm<=12;mm++){
	    		%>
	    			<option value="<%=mm%>"><%=mm %>월</option>	
	    		<%
	    		}
	    		%>
	    		</select>
	    		<select name="day">
	    		<%
	    		for(int dd=1;dd<=31;dd++){
	    		%>
	    			<option value="<%=dd%>"><%=dd %>일</option>	
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
    				<option value="010">010</option>
    				<option value="011">011</option>
    				<option value="015">015</option>
    			</select>
    			<input type="number" name="p2" class="input2">
    			<input type="number" name="p3" class="input2">
    		</td>
    	</tr>
    	<tr>
    		<th>주소</th>
    		<td>
    		<div style="line-height:2.0;">
    		<input type="number" name="zipcode" class="input2" maxlength ="6">
    		<button type="button" onclick="fn_popup()">우편번호찾기</button>
    		<br>
      		<input type="text" name="addr" class="input1">
    		</div>
    		</td>
    	</tr>
    	<tr>
    		<th>취미</th>
    		<td>
    		<input type="checkbox" name="hobby" value="바둑">바둑
    		<input type="checkbox" name="hobby" value="장기">장기
    		<input type="checkbox" name="hobby" value="체스">체스		
    		</td>
    	</tr>
    	<tr>
    		<th>이메일</th>
    		<td><input type="text" name="email" class="input1"></td>
    	</tr>
    	<tr>
    		<th>홈페이지</th>
    		<td><input type="url" name="homepage" class="input1"></td>
    	</tr>

    </table>
    <div style="width:600px; 
    			text-align:center; 
    			margin-top:10px;">
    	<button type="submit" onclick="fn_submit();return false;">저장</button>
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

