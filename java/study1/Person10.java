package study1;

public class Person10 {
	// 캡슐화 :접근자정자
	// 접근지정자는 내부 접근일 경우는 의미 없음, 철저히 외부 접근에 대한 제어
	public String name;	  //같은 패키지(0),다른패키지(0);전체허용 (0)
	protected int height; //같은패키지(0),다른패키지(x) ; 상속관계(0)
			  int age;	  //같은패키지(0), 다른패키지(x) ; 상속관계(x)
	private   int weight; //같은패키지(x),다른패키지(x); 상속관계(x)
	void abc() {
		name = "호돌이";  //내부접근(0)
		height = 300;	//내부접근(0)
		age = 15;		//내부접근(0)
		weight = 200;	//내부접근(0)
	}
}
