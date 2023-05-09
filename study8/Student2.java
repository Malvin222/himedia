package study8;
	class Person2{
	int age;
	public String name;
	protected int height;
	private int weight;
	
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight=weight;
	}
}
public class Student2 extends Person2{
	public void dataSet() {
		age=30;
		name="홍길동";
		height=175;
		setWeight(70);	//상위 클래스의 메소드 실행
	}
public static void main(String[] args) {
	Student2 s1 = new Student2();
	s1.dataSet();	//변수 값 부여됨
	//s1.weight = 90; *error* 상송이지만 private 처리된
	// \n:줄바꿈(개행)
	System.out.println
	("나이: "+s1.age+"\n이름: "+s1.name+"\n키: "+s1.height+"\n몸무게: "+s1.getWeight());
}
}
