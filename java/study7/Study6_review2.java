package study7;

public class Study6_review2 {
	// 인스턴스 변수
	int a = 0;
	int b = 0;
	int c = 0;
	
	//클래스변수,공유변수,전역변수 => 공유 영역에 저장됨
	static int d = 0;	
	// 인스턴스 메소드
	public int sum1() {
		int result = a + b + c;
		return result;
	}
	//클래스 메소드,공유 메소드,전역 메소드 =>클래스 변수만 불러올 수 있음
	public static int sum2() {
		int result = +d;
		return result;
	}
	
	public static void main(String[] args) {
		//김철수(90,80,70), 홍길동(70,78,88)
		//인스턴스 화(객체화) =>클래스 변수는 불러오지 못함
		Study6_review2 kim = new Study6_review2();
		Study6_review2 hong = new Study6_review2();
		
		kim.a = 90;
		kim.b = 80;
		kim.c = 70;
		
		hong.a = 70;
		hong.b = 78;
		hong.c = 88;
		
		System.out.println("김의 합계 : " + kim.sum1());
		System.out.println("홍의 합계 : " + hong.sum1());
		
		
	}
}
