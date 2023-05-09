package study8;

import study1.Person10;	//경로지정

public class Student10 extends Person10 {
	/*public String name;
	protected int height;	//상속관계일경우 허용 아닐경우 다른패키지에는 불가
			  int age;
	private   int weight;
	*/
	public static void main(String[] args) {
		Student10 ss = new Student10();
		ss.height=170;
		ss.name="홍길동";
		//ss.age=30; //default
		//ss.weight=70; //private
		
		Person10 ss1= new Person10();
		//ss1.height=170; //protected
		ss1.name="홍길동";
	//	ss1.age=30; //default
		//ss1.weight=70; //private
	}
}
