package study12;

public class exception_Test {
	
	//
	int hap;
	public void myrun(int a ) {	//매개변수
		System.out.println("연산결과 : " + a );
	}
	
	public static void main(String[] args) {
		exception_Test t = new exception_Test();	//인스턴스화
		int result;	//int result = 0; (x) ;; 
		for(int i=4;i>=-4;i--) {	//4 3 2 1 0
			try {
				result = 100/i;
				t.myrun(result);
			}catch(ArithmeticException e) {
				t.myrun(-1);
				
			}
		}
	}
}
