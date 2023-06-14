<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//파라메터 값을 받음
String yy = request.getParameter("yy");
String mm = request.getParameter("mm");

//Calendar 클래스의 인스턴스(객체)화
Calendar cal = Calendar.getInstance();

//현재 시점의 년,월,일
int y = cal.get(Calendar.YEAR); //현재년도
int m = cal.get(Calendar.MONTH); //현재월
int d2 = cal.get(Calendar.DATE); //현재날짜

//현재 시점의 년~ 월~ 일 변수처리 
String today =y+"-"+(m+1)+"-"+d2;
//유효성 체크
if(yy != null && 
   mm !=null && 
   !yy.equals("") && 
   !mm.equals("") )
{	
	boolean yy_chk = yy.matches("[0-9]{4}"); //true or false
	boolean mm_chk = mm.matches("[0-9]{1,2}"); //true or false
	if(yy_chk ==true && mm_chk==true){
		y= Integer.parseInt(yy);
		m= Integer.parseInt(mm)-1;
	}
}
//-----------------------------------------
// 출력하는 (달의 1)일의 요일과 마지막날을 얻기위한 세팅
cal.set(y,m,1);	//cal.set(2023,5,1)
// 출력하는 달의 1일의 요일을 얻음
int dayOfweek = cal.get(Calendar.DAY_OF_WEEK);	//5(목)
//출력하는 달의 마지막 날을 얻음
int lastday =cal.getActualMaximum(Calendar.DATE);//30

//이전버튼의 세팅
//		cal2.jsp?yy =2023&mm=5
int b_yy;
int b_mm = (m+1)-1; //이전달의 세팅
if (b_mm <1 ){
	b_yy = y-1;	//2023 - 1 =2022
	b_mm = 12;
}else {
	b_yy=y;
}

//다음 버튼의 세팅
int n_yy;
int n_mm = (m+1)+1;	//6_+1 -> 7
					//(11+1) -> 13
if(n_mm>12){
	n_yy =y+1;	//2023+1 =2024
	n_mm =1;	//13 ->1
}else{
	n_yy=y;
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<div>
<form name="frm" method="post" action="cal2.jsp">
	<input type="text" name="yy" size="4">년
	<input type="text" name="mm" size="2">월
	<input type="submit" value="달력보기">	
</form>
</div>

<div>
 <input type="button" value="이전" onclick = "location='cal2.jsp?yy=<%=b_yy%>&mm=<%=b_mm%>'">
<%=y %>년<%=m+1 %>월
 <input type="button" value="다음" onclick = "location='cal2.jsp?yy=<%=n_yy%>&mm=<%=n_mm%>'">
</div>


<table border = "1" width = "350"> 
   <tr>
      <th>일</th>
      <th>월</th>
      <th>화</th>
      <th>수</th>
      <th>목</th>
      <th>금</th>
      <th>토</th>
   </tr>
   <tr >
   	<%
   	int cnt=0;
   	for(int i=1;i<dayOfweek;i++){	//1~4
   		out.print("<td></td>");
   		cnt++;
   	}
   	   	
   	for (int d=1; d<=lastday; d++){
   		cnt++;	//1~7
  		String color ="#555555";
   		if(cnt==1){	//일요일
  			color="red";
  		} else if (cnt== 7){	//토
  			color="blue";
  		}
   		
   		String v_date = y+"-"+(m+1)+"-"+d;
   		if (today.equals(v_date)){
   			color = "green";
   		}
   	%>
      <td align ="center"><font color="<%=color %>"><%= d %></font></td>
   <%
   		if(cnt==7){
   			out.print("</tr><tr>");
   			cnt=0;
   		} 
   }
   %>
   </tr>
</table>
</body>
</html>