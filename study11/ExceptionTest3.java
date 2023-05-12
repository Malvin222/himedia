package study11;

public class ExceptionTest3 {
	public static void main(String[] args) {
		//1.zero error //0에러
		//2.ArrayIndexOutOfBoundsException error //배열에러
		//3.NumberFormatException // 형변환 오류
		//4.StringIndexOutofBoundsException//자리번호 오류
		String a1 ="abc";
		String a2 = "123";
		int a3=0;
		int a4=0;
		try {
			a3 = Integer.parseInt(a1);
			a4 = Integer.parseInt(a2);
			} catch(NumberFormatException e) {
			System.out.println("형변환 오류");
			}catch(Exception e ) {
				System.out.println("오류");
			}
		System.out.println(a4);
		
		//풀어보기
		String str ="abc";
		//StringIndexOutOfBoundsException
		try {
			System.out.println(str.charAt(3));
		}catch(StringIndexOutOfBoundsException e ) {
			System.out.println("자리번호 오류");
		}catch(Exception e ) {
			System.out.println("오류");
		}
	}
}
