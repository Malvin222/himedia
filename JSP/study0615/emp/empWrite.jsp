<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empWrite</title>
</head>
<body>
<form name = "frm" method = "post" action = "empWriteSave.jsp">
   <table border="1" width = "300">
      <tr>
         <th>사원번호</th>
            <td> <input type = "text" name="empno"> </td>
      </tr>
      <tr>
         <th>사원이름</th>
            <td> <input type = "text" name="ename"> </td>
      </tr>
      <tr>
         <th>급여</th>
            <td> <input type = "text" name="sal"> </td>
      </tr>
      <tr>
         <th>입사일</th>
            <td> <input type = "text" name="hiredate"> </td>
      </tr>
      <tr>
         <th>업무</th>
            <td> <input type = "text" name="job"> </td>
      </tr>
      <tr>
         <th>매니저</th>
            <td> <input type = "text" name="mgr"> </td>
      </tr>
      <tr>
         <th>커미션</th>
            <td> <input type = "text" name="comm"> </td>
      </tr>
      <tr>
         <th>부서</th>
            <td> <input type = "text" name="deptno"> </td>
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