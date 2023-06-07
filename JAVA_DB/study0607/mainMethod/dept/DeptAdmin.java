package dept;

import java.util.Scanner;

public class DeptAdmin {
	public static void main(String[] args) throws Exception {
		System.out.println("[ 부서정보관리 시스템 ]");
		System.out.println("1.부서목록\n 2.부서입력\n 3.부서변경\n 4.부서삭제");
		Scanner scn = new Scanner(System.in);
		System.out.print("메뉴번호>>");
		
		int menu = scn.nextInt();
		switch(menu) {
			case 1 : deptList();
			break;
			case 2 : deptInsert();
			break;
			case 3 : deptUpdate();
			break;
			case 4 : deptDelete();
			break;
			default : System.out.println("없는번입니다.");
		}
		
	}
	public static void deptList() throws Exception{
		
	}
	public static void deptInsert() throws Exception{
		
	}
	public static void deptUpdate() throws Exception{
		
	}
	public static void deptDelete() throws Exception{
		
	}
}
