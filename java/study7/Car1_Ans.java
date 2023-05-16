package study7;


public class Car1_Ans {

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
		speed = 0;
	}
	public static void main(String[] args) {
		Car1_Ans.carName = "소나타";
		Car1_Ans.speed= 100;
		speedUp();
		speedUp();
		System.out.println("차이름: "+carName+", 속도: "+speed);
		stop();
		System.out.println("차이름: "+carName+", 속도: "+speed);
		
		carName="그랜져";
		speed= 50;
		speedUp();
		speedUp();
		System.out.println("차이름: "+carName+", 속도: "+speed);
		stop();
		System.out.println("차이름: "+carName+", 속도: "+speed);
		
	}
}
