<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결  (경로 확인)-->
<%@ include file ="../../include/oracleCon.jsp" %>

<%
//최대 사원번호에서 1증가
String sql1 = "Select Max(empno)+1 as empno from emp" ;
Statement stmt1 = con.createStatement();
ResultSet rs1 =stmt1.executeQuery(sql1);
rs1.next();
String n_empno = rs1.getString("empno");

//업무
String sql2= "select distinct(job) as job from emp ";
Statement stmt2 =con.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql2);

//매니저 출력
String sql3 = " select empno,ename from emp "
			  +"  order by ename";
Statement stmt3 = con.createStatement();
ResultSet rs3 = stmt3.executeQuery(sql3);

//부서 및 부서이름
String sql4 = "select deptno,dname from dept order by dname ";
Statement stmt4 = con.createStatement();
ResultSet rs4 = stmt4.executeQuery(sql4);
%>

<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
</head>
<body>
<form name = "frm" method = "post" action = "empWriteSave.jsp">
   <table border="1" width = "300">
      <tr>
         <th>사원번호</th>
            <td> <input type = "text" name="empno" value="<%=n_empno %>" readonly> </td>
      </tr>
      <tr>
         <th>사원이름</th>
         <td> <input type = "text" name="ename"> </td>
      </tr>
      <tr>
         <th>급여</th>
            <td> <input type = "number" name="sal"> </td>
      </tr>
      <tr>
         <th>입사일</th>
            <td> <input type = "date" name="hiredate"> </td>
      </tr>
      <tr>
         <th>업무</th>
  				<!-- 셀렉트 옵션(옵션이 반복문안에 들어와서 전체목록이 뜸) -->
            <td><select name="job">
            <%
            while(rs2.next()) {
            	String job = rs2.getString("job");
            %>
            		<option value="<%=job %>"><%=job %></option>
            <%	
            }
            %>
            	</select> 
            	
             </td>
      </tr>
      <tr>
         <th>매니저</th>
            <td> <select  name="mgr">
            	<%
            	while(rs3.next()){	
            		String empno = rs3.getString("empno");
            		String ename = rs3.getString("ename");
            	%>
            	<option value ="<%=empno %>"><%=ename %></option>            	
            	<%
            	}
            	%>
            	
            </select> </td>
      </tr>
      <tr>
         <th>커미션</th>
            <td> <input type = "text" name="comm"> </td>
      </tr>
      <tr>
         <th>부서</th>
            <td> 
            <select name="deptno">
            <%
            while(rs4.next()){
            	String deptno = rs4.getString("deptno");
            	String dname = rs4.getString("dname");
            %>
            <option value="<%=deptno %>"><%=dname %></option>
            
            <%
            }
            %>
            </select> 
            
            </td>
      </tr>
      <tr>
         <th colspan = "2"> 
            <button type = "submit">저장</button>
            <button type = "reset">취소</button>
            <button type = "button" onclick="location='empList.jsp'">목록</button>
         </th>
      </tr>
   </table>
</form>

</body>
</html>