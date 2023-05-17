package study14;

public class Test101 {
	int a;
	int b;
	public static void main(String[] args) {
		//참조클래스 참조변수 = new 생성자;
		//객체화 -> 클래스 안에 있는 변수 등등을 메모리 특정 위치에 저장
		Test101 t1 = new Test101();	//t1의 값이 Test101()의 새로운 위치에 저장	//독립적 공간
		Test101 t2 = new Test101();	//t2의 값이 Test101()의 다른 새로운 위치에 저장	//독립적 공간
		t1.a=100;	// t1의 값이 저장된 Test101()독립적 공간의 a에 100을 저장	//이름이 같지만 다른 공간
		t2.a=200;	// t2의 값이 저장된 Test101()독립적 공간의 a에 200을 저장	//이름이 같지만 다른 공간
		t2=t1;		//t2의 값이 저장된 Test101()공간이 t1의 값이 저장된 Test101()의 공간으로 바뀜
					//t2의 값이 저장된 Test101()공간은 더미 공간이 되어버림(아무도 쓰지 않는 공간)
		System.out.println(t1.a);
		System.out.println(t2.a);
		
	}
}
