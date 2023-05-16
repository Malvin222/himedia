package study8;
// 접근지정자 : public -> protected-> default ->private
public class Person1 {
	//멤버변수, 인스턴스(객체)변수
	private int age;		//int age = 0;	//접근 지정자 생략: 같은 패키지에서 상속까지만 접근 허용
	public String name;	 //String name null;//public:전체 접근 가능
	private int height;	//protected: 다른 패키지의 클래스에서 접근 불가
	private int weight;		//private : 다른 클래서(외부 객체)에서는 접근 불가(입력 및 호출 불가)
	//멤버변수, 클래스변수
	static int score;	
	
	//Person1(){}  //new Person1()
	//외부에서는 weight 변수에게 직접 호출이 불가하므로 메소드를 통해 데이터 값을 전달 해주려는 의미
	public int getWeight() {
		return weight;	//getWeight()메소드를 호출하는 사용하는 곳에 몸무게 변수값을 던져줌
	}
	public void setWeight(int weight) {	//매개변수를 설정하여 몸무게 값을 받는다.	
		if(weight<0) {
			weight = 0;
		}                                                                                                                                                                                                                                                     
		//this는 현재 객체를 의미한다.
		//즉 실행중인 객체 안에 있는 몸무게의 값을 매개변수에게 받는다는 의미임
		this.weight=weight;	//해설: 현재객체.몸무게 = 매개변수;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
}
