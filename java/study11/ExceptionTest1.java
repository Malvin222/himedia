package study11;

public class ExceptionTest1 {
	public static void main(String[] args) {
		//예제1
		int a = 0;
		int b = 20;
		
		System.out.println(a/b); //0
		
		int c = 10;
		int d = 0;
		try {
		System.out.println(c/d); //0
		} catch(Exception e) {
			System.out.println("잘못된 연산");
		}
		System.out.println("11111");
		
		//예제2
		int[] array1 = {11,22,33};
		try {
			System.out.println(array1[10]);			
		}	catch(Exception e) {
			System.out.println("배열오류");
		}
		System.out.println(array1[1]);			
		
		//예제3
		System.out.println("-------");
		try {
			System.out.println(array1[0]);//11			
			System.out.println(array1[10]);			
			System.out.println(array1[1]);	
		}	catch(Exception e) {
			System.out.println("배열오류22");
		}
		
		System.out.println(array1[2]);//33
	}
}
