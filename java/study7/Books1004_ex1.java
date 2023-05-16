package study7;

public class Books1004_ex1 {
	int price =10000;
	String bookName;

	public Books1004_ex1() {
	}
	public Books1004_ex1(String a) {	//a= "자바의첫걸음"
		bookName= a;
	}
	public Books1004_ex1(String a, int b) {
		bookName = a;
		price = b;
	}
	public static void main(String[] args) {
		Books1004_ex1 java = new Books1004_ex1("자바의 첫걸음");
		Books1004_ex1 linux = new Books1004_ex1("리눅스 마스터",35000);
		System.out.println
		("My Book: "+java.bookName + ", 가격: "+java.price);
		
		System.out.println
		("My Book: "+linux.bookName + ", 가격: "+linux.price);
		
		
	}
}