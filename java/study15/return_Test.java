package study15;

public class return_Test {

	public static void abc1() {
		int sum = 10+100;
		if(sum<1000) {
			
			return; //메소드 중지
			//int sum2 = 100+100;//리턴 아래 더이상 올수 없음
		}
		int sum2 = 100+100;//리턴이 if문 등에 감싸져 있으면 아래 추가적으로 올 수있음.
		
	}
	public static int abc2() {
		int sum =10+100;
		return sum;  //호출한 곳(사용한 곳)에 결과값(메소드결과값) 리턴 /메소드 중지
	}
	public static void main(String[] args) {
		int eng = abc2();
		System.out.println(eng);
	}
}
