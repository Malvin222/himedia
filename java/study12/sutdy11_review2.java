package study12;

public class sutdy11_review2 {
	
	public static void main(String[] args) {
		int a= 100;
		int b= 0;
		int [] c = {10,20,30};
		
		System.out.println(c[1]);	//정상출력
		//ArithmeticException	->하나의 클래스
		//ArrayIndexOutOfBoundsException
		//NumberFormatException
		//StringIndexOutOfBoundsException
		
		String d = "abc";
		
		try {
		System.out.println(c[0]);	
		System.out.println(Integer.parseInt(d));//형변환 error
		System.out.println(c[2]);	
		//System.out.println(a/b);	//zero erro
		//System.out.println(c[7]);	// 배열 자리번호 error
		//System.out.println(Integer.parseInt(d));//형변환 error
		//System.out.println(d.charAt(5));	//문자열 자리번호 error
			}	catch(ArithmeticException e) {		
					System.out.println("zero오류가 발생했습니다");
			}	catch(ArrayIndexOutOfBoundsException e) {			
					System.out.println("배열 자리번호 오류가 발생했습니다");
			}	catch(NumberFormatException e) {			
					System.out.println("형변환 오류가 발생했습니다");
			}	catch(StringIndexOutOfBoundsException e) {			
					System.out.println("문자열 자리번호 오류가 발생했습니다");
			}	catch(Exception e){
					System.out.println("오류가 발생했습니다.");
			}
		System.out.println(d.charAt(0));	//문자열 자리번호 error
	}
}
