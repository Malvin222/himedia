package study6;

public class Car1 {
	static int speed;
	static String carName;
	public static void speedUp() {
		speed++;
	}
	public static void speedDown() {
		speed--;
		if(speed<0) {
			stop();
			}
	}
	public static void stop() {
		speed=0;
	}
	public static void main(String[] args) {
		Car1 car1 = new Car1();
		car1.carName ="소나타";
		car1.speed = 100;
		car1.speedUp();
		car1.speedUp();
		System.out.println
		("차이름:"+car1.carName+" 현재속도:"+car1.speed);
		car1.stop();
		System.out.println
		("차이름:"+car1.carName+" 현재속도:"+car1.speed);
	}
}


