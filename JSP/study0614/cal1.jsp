<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String yy = request.getParameter("yy");
String mm = request.getParameter("mm");

Calendar cal = Calendar.getInstance();

	
int y = cal.get(Calendar.YEAR); //출력년도
int m = cal.get(Calendar.MONTH); //출력월

if(yy != null && 
   mm !=null && 
   !yy.equals("") && 
   !mm.equals("") )
{	
	//유효성체크
	boolean yy_chk = yy.matches("[0-9]{4}"); //true or false
	boolean mm_chk = mm.matches("[0-9]{1,2}"); //true or false
	if(yy_chk ==true && mm_chk==true){
		y= Integer.parseInt(yy);
		m= Integer.parseInt(mm)-1;
	}
}

cal.set(y,m,1);	//2023-06-01
int dayOfweek = cal.get(Calendar.DAY_OF_WEEK);
int lastday =cal.getActualMaximum(Calendar.DATE);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<form name="frm" method="post" action="cal1.jsp">
	<input type="text" name="yy" size="4">년
	<input type="text" name="mm" size="2">월
	<input type="submit" value="달력보기">	
</form>
</div>

<div>
<%=y %>년<%=m+1 %>월
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