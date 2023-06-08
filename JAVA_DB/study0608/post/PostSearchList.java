package post;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class PostSearchList extends DbConnect {
	public static void main(String[] args) throws Exception{
		System.out.println("[우편번호 검색 프로그램]");
		System.out.print("1.우편번호 검색 2.시도 검색 3.구군검색 4.읍명동리 검색 5.건물명 검색");
		Scanner scn =new Scanner(System.in);
		int menu = scn.nextInt();
		
		switch(menu){
		case 1 : search_1();
			break;
		case 2 : search_2();
			break;
		case 3 : search_3();
			break;
		case 4 : search_4();
			break;
		case 5 : search_5();
			break;
		}
	}
	
	public static void search_1() throws Exception {
		Statement stmt = Connection().createStatement();
		Scanner scn =new Scanner(System.in);
		System.out.println("[우편번호 검색]");
		System.out.println("우변번호(예:000000)>>");
		String post =scn.next();
		String sql = "select a1 post \r\n"
				+ "       ,a2||' '||a3||' '||a4||' '||a5||' '||a6||' '||a7 address \r\n"
				+ "       from post1 \r\n"
				+ "       where a1='"+post+"'";
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("결과)");
		System.out.println("우편번호 \t 주소");
		int cnt = 0;
		while( rs.next() ) {
			cnt++;
			String post1 = rs.getString("post");
			String address = rs.getString("address");
			System.out.println(post1+"\t"+address);
		}
		if (cnt==0) {
			System.out.println("***검색 결과가 없습니다.***");
		}
	}
	public static void search_2() throws Exception {
		Statement stmt = Connection().createStatement();
		Scanner scn = new Scanner(System.in);
		System.out.println("[시도 검색]");
		System.out.println("시/도>>");
		String search = scn.next();
		String sql = "select a1 post \r\n"
				+ "       ,a2||' '||a3||' '||a4||' '||a5||' '||a6||' '||a7 address \r\n"
				+ "       from post1 \r\n"
				+ "       where a2 like '%"+search+"%' or a3 like '%"+search+"%'";
		ResultSet rs =stmt.executeQuery(sql);
		System.out.println("결과)");
		System.out.println("우편번호 \t 주소");
		int cnt = 0;
		while ( rs.next() ) {
			cnt++;
			String post =rs.getString("post");
			String address = rs.getString("address");
			System.out.println(post +"\t"+address);
		}
		if(cnt ==0) {
			System.out.println("***검색 결과가 없습니다.***");
		}
	}
	public static void search_3() throws Exception {
		
	}
	public static void search_4() throws Exception {
		
	}
	public static void search_5() throws Exception {
		
	}
}
