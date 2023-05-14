package test1;

class t1{
	
	public static int a = 1;//스태틱변수(클래스변수) 본사 및 직영점 변수
	int a1 = 2;	//인스턴스 변수
	
	public static int i() {
		int b = 11111;
		return b;	//i 메소드의 결과를 리턴해줘서 i메소드의 결과값이 리턴값으로 나옴(값을 받아와야하는 메소드)
	}
	//void 결과값 return 필요없음	
	public void tt() {			//인스턴스 메소드 ->대리점의 규칙
		System.out.println("no static");
	}
	public static void tt2() {	//클래스 메소드 ->본사규칙
		System.out.println("static");
	}

}


public class static_test{
	
	public static void main(String[] args) {
		//객체생성 	(대리점생성)	new: 대리점만들때 직영점 및 다른 대리점에서 생성한 규칙을 초기화 시켜줘야함
		//초기화 시켜줘야 깨끗하게 시작 가능 (사무실을 낼 때 입주청소)
		t1 tt3 = new t1();		 
		tt3.tt();	//대리점(객체,오브젝트)를 만들어서 사용해야 사용가능
		//t1.tt();	//대리점 규칙이라 대리점에서만 사용가능
		t1.tt2();	//본사규칙이라 본사만 적어주면 바로 사용가능(직영점 사용가능)
		System.out.println(t1.a);	//클래스 변수 ->직영점에서 사용가능
		//System.out.println(t1.a1);// 인스턴스 변수 ->직영점에서 사용 불가 
		System.out.println(tt3.a1);	//인스턴스 변수 -> 객체 (대리점)에서 사용가능
		System.out.println(tt3.a);
		
		System.out.println(t1.i());
		System.out.println(tt3.i());
		t1.a = 3;	//클래스 변수 변경가능
		//t1.a1 = 3;	//인스턴스 변수 변경 불가
		tt3.a1 = 5;
		System.out.println(t1.a);
		System.out.println(tt3.a1);

	}
}
