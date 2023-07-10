package sample1;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.DbConnect;

@WebServlet("/InputSave")
public class InputSave extends HttpServlet {
	
	public void doPost(HttpServletRequest req,
					   HttpServletResponse res ) {
		 try {
			 
			 DbConnect db = new DbConnect();
			 Connection con = db.oracleCon();
			 
			 req.setCharacterEncoding("utf-8");
			 
			 String id =req.getParameter("userid");
			 String pw =req.getParameter("userpass");
			 String nm =req.getParameter("name");
			 
			 String sql="insert into sample1 values('"+id+"','"+pw+"','"+nm+"')";
			 Statement stmt = con.createStatement();
			 int result = stmt.executeUpdate(sql);
			 System.out.println("result : "+result);
		 
			 //응답처리 //브라우저에 보여줄 내용
			 res.setContentType("text/html;charset=UTF-8");
			 PrintWriter out = res.getWriter();
			 out.print("<script>alert('저장완료');</script>");
		 } catch(Exception e) { }
		 
	}
}
