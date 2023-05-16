package Study9;

abstract class Sound{
	abstract void cry(); //추상메소드(명세처리)
}
class Cat extends Sound{
	void cry() {
		System.out.println("야옹야옹!!");
	}
}
class Dog extends Sound{
	void cry() {
		System.out.println("멍멍!!");
	}
}
public class Animal {
	public static void main(String[] args) {
		//Sound ss = new Sound(); (x)
		Cat cat = new Cat();
		Dog dog = new Dog();
		cat.cry();
		dog.cry();
	}
}
