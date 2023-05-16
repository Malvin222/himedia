package study12;

public class study11_review {
	
	public static void main(String[] args) {
		
		//정규표현식 ( 핸드폰번호 유효성 검사)
		//010,011,015  - 숫자 3,4자리 - 숫자 4자리
		String phone ="011-12342-5678";
		String pattern = "01(0|1|5)-[0-9]{3,4}-[0-9]{4}";
		System.out.println(phone);
		if(phone.matches(pattern)) {
			System.out.println("올바른 번호");
		}else {
			System.out.println("올바르지 않은 번호 ");
		}
		//예외처리 :문법 오류 이외의 사항이 발생하여 프로그램 중단을 방지한다.
		//		ex)DB연결, I/O(Input,Outpu)t연결 시 필수적으로 예외처리를 함
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
		System.out.println(a/b);	//zero erro
		System.out.println(c[7]);	// 배열 자리번호 error
		System.out.println(Integer.parseInt(d));//형변환 error
		System.out.println(d.charAt(5));	//문자열 자리번호 error
		}	catch(Exception e) {			
			System.out.println("오류가 발생했습니다");
		}
		System.out.println(d.charAt(0));	//문자열 자리번호 error
	}
}
