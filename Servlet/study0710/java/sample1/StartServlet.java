package sample1;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/StartServlet")
public class StartServlet extends HttpServlet {
	public StartServlet() {
		System.out.println("===== start =====");
	}
}
