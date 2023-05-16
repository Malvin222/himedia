package study8;

public class Studen1 {
	public static void main(String[] args) {
		//참조클래스 참조변수 = new 생성자; (생성자: new Person1()이 실행될때 같이 실행되는 요소)
		Person1 s1 = new Person1();
		s1.name="홍길동";
		s1.setAge(30);
		s1.setHeight(170);
	//	s1.weight=70; //private 처리된 변수
		s1.setWeight(70);
		System.out.println(s1.name);
		System.out.println(s1.getAge());
		System.out.println(s1.getHeight());
	//	System.out.println(s1.weight);// private 처리된 변수,호출불가
		System.out.println(s1.getWeight());
	}
}
