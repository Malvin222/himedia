package study7;

public class Overloading {
	
	// 다형성-> 오버로딩 : 같은 이름의 메소드를 매개변수를 (타입,개수) 다르게 하여 생성하는 기법
	public void sum() {
		System.out.println(10+10);
	}
	public void sum(int a) {
		System.out.println(a +10);
	}
	/*public void sum(int b) {  //타입과 개수 같으면 같은요소
		System.out.println(b +10);
	}*/
	public void sum(String a) {		//타입이 다름
		System.out.println(a);
	}
	public void sum(int a,int b) {		//개수가 다름
		System.out.println(a +b);
	}
	public void sum(int a,int b,int c) {
		System.out.println(a +b+ c);
	}
	public void sum(String str,int a,int b) {	//타입이 다름
		System.out.println(str);
		System.out.println(a +b);
	}
	public static void main(String[] args) {
		Overloading s1 = new Overloading();
		s1.sum();
		s1.sum(10,20);
		s1.sum(30,50,100);
		s1.sum("메롱",10,20);
	}
}
