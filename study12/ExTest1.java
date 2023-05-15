package study12;

public class ExTest1 {
	//abc()사용하는곳에서 MyException 사용해야함
	static void abc() throws MyException{	
		System.out.println("haha");
	}
	public static void main(String[] args) {
		try {
			abc();	//haha출력
			throw new MyException();	
		}catch (MyException e) {
			System.out.println(e.toTest());
		}
	}
}
