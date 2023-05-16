package study7;

public class Test7 {
	
	// 생성자, 다형성(오버로딩)
		Test7(boolean a) {	}
		Test7(int a) {	}
		Test7(String a) {	}
	public static void main(String[] args) {
		new Test7(true);
		new Test7(1);
		new Test7("java");
	}
}
