package study7;

public class MyCar_ex3 {
	int maxSpeed;
	String carName;
	String carColor;

	public MyCar_ex3(String carName,int maxSpeed) {
		this.carName=carName;
		this.maxSpeed=maxSpeed;
	}
	public MyCar_ex3(String carName, int maxSpeed, String carColor) {
		this.carName=carName;
		this.maxSpeed=maxSpeed;
		this.carColor=carColor;
	}
	public void  maxSpeedUpdate(int speed) {
		this.maxSpeed+=speed;
	}
	public static void main(String[] args) {
		MyCar_ex3 car1 = new MyCar_ex3("소나타",230);
		MyCar_ex3 car2 = new MyCar_ex3("그랜저",300,"white");
		System.out.println(car1.carName+":"+car1.maxSpeed);
		System.out.println(car2.carName+":"+car2.maxSpeed);
		car1.maxSpeedUpdate(-20);
		System.out.println(car1.carName+":"+car1.maxSpeed);
	}
}
