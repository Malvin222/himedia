package study12;

public class Exception_Throws {
	
	//메소드 이름 뒤의 throws Exceptin ->호출한 곳(실행한곳)에 강제 Exception(try,catch)처리 해야함
	//Exception 처리를 해야함
	static void methodTest1()throws Exception{	
		System.out.println("test");
	}
	
	public static void main(String[] args) {
			try {
				methodTest1();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
}