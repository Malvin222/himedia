package study6;

class Mysubject1{
	// 클래스변수(전역변수)	//클래스 명을 통해 접근 가능
	static String title;	//static : 공유메모리 영역에 포함
	// 인스턴스변수(객체변수)
	int price = 0 ;			//각자 고유의 메모리 공간을 차지
}

public class Ex10_6_Myschool1 {
	
	public static void main(String[] args) {
		Mysubject1 st1 = new Mysubject1();
		Mysubject1 st2 = new Mysubject1();
		
		st1.title = "java";
		st2.title = "oracle";
		st1.price = 100;
		st2.price = 200;
		System.out.println(Mysubject1.title);
		System.out.println(Mysubject1.title);
		System.out.println(st2.price);
		System.out.println(st2.price);
		
	}
}
