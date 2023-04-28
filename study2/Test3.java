package study2;

public class Test3 {

	public static void main(String[] args) {
		//논리타입
		boolean a1 = true; //o
		boolean a2 = false; //o
		//boolean a3 = "true"// x
		//boolean a4 = 1; //x
		boolean a5 = (10<20);
		System.out.println(a5);
		//String s1 = (10<20);//x
		
		final String color = "blue";   //fanal : 일반변수에서 상수변수로 변환 다른값으로 덮어씌워지지 않음.
		//color = "red"; //
		System.out.println(color);
	}

}
