package study7;

public class Books {
	String bookName ="JSP 기초";
	// 생성자 : 메소드와 같은 모습을 하고 있으면서 객체화될 때 자동실행되는 요소
	public Books() {
		System.out.println("한빛미디어");
	}
	public Books(String name) {	//매개변수 타입 다름
		bookName = name;
	}
	public static void main(String[] args) {
		Books myBook = new Books(); //한빛 미디어 출력
		Books yourBook  = new Books("JAVA");
		System.out.println(myBook.bookName); //JSP기초
		System.out.println(yourBook.bookName);	//JAVA
	}
}
