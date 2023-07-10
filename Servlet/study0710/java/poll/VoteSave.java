package poll;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.print.attribute.standard.PrinterMessageFromOperator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.DbConnect;

/**
 * Servlet implementation class PollWriteSave
 */

//  어노테이션 : 주석
@WebServlet("/voteSave")
public class VoteSave extends HttpServlet {
	/**
	 * @see 설문저장
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
						throws ServletException, IOException {
		
		Connection con = DbConnect.oracleCon();
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();
		request.setCharacterEncoding("UTF-8");
	
		String subCode = request.getParameter("subCode");
		
		try {
		String sql = "Update pollsub set"
					+" vote = vote+1 "
					+" where code ='"+subCode+"' ";
		
		Statement stmt = con.createStatement();
		int result =stmt.executeUpdate(sql);
		
		}catch (Exception e ) { }
		out.print(  " <script> "
				  + " alert('투표완료!'); "
				  + " self.close();"
				  + " </script> "
				);
	}
}
