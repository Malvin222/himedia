package study12;

public class Exception_Throw {
	public static void methodTest1() {
		try {
			//new : 일부러 exception 발생 시킬때의 키워드
			throw new Exception("~~");
			//System.out.println(Integer.parseInt("aa"));
		}catch (Exception e ) {
			// getMessage(): Exception()가 없을시 자바에서 설정된 메세지 
			//				Exception("~~~") ```출력
			//return detailMessage;
			System.out.println(e.getMessage());
		}
	}
	public static void main(String[] args) {
		methodTest1();
	}
}
