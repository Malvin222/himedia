package study2;

public class Test2 {

	public static void main(String[] args) {
		//byte short int long
		//byte a = -129;	//-128 ~ 127
		short b =100;		//-32,768~ 32,767		
		int c = 100;		//-2,147,483,648
		long d = 300000000000L; // long 타입은 뒤에 L을 붙여줘야함
		
		float f = 3.14f; //float 뒤에 f 붙여줘야함 소수점 7개
		float f1 = 3.111111111114124344f;
		double g = 3.141111111111111111; // 소수점 15개
		
		System.out.println(f1);
		System.out.println(g);
	
		char c1 = 'a';
		c1++;
		System.out.println("char a : " + c1);
		//char c2 = 'ab';
		//char c3 = "a";
		char c4 = '가';
		c4++;
		System.out.println("char c4 : " +c4);
		
		String s1 = "a";
		System.out.println("String s1 : " + s1);
		
		char c3 = 'a';
		char c5 = 97;
		System.out.println("c5 : " + c5);
		
	}
}
