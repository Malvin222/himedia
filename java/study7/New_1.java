package study7;

public class New_1 {
	int a= 10; //멤버 변수,인스턴스변수
	
	//	생성자 : 이름의 첫글자가 반드시 대문자
	//			호출불가->(일반 메소드처럼 사용불가)
	
	
	public New_1() { //생성자의 기본
		System.out.println("-New_1 클래스의 객체화-");
	} 
	//생성자의 다형성->오버로딩
	public New_1(String a) { //생성자의 기본
		System.out.println("-New_1 클래스의 인스턴스화-");
	} 
	public static void main(String[] args) {
		//New_1 t1 = new New_1();
		New_1 t2 = new New_1("abc");
		//System.out.println(t1.a);
		
	}
}
