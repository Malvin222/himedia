package study6;

public class Car2 {
	int speed;
	String carName;
	public void speedUp() {
		speed++;
	}
	public void speedDown() {
		speed--;
		if(speed<0) {
			stop();
		}
	}
	public void stop() {
		speed = 0;
	}
	public static void main(String[] args) {
		Car2 c1 = new Car2();
		c1.carName = "소나타";
		c1.speed = 100;
		c1.speedUp();
		c1.speedUp();
		System.out.println("차이름:"+c1.carName+" 현재속도:"+c1.speed);
		c1.stop();
		System.out.println("차이름:"+c1.carName+" 현재속도:"+c1.speed);
		
		System.out.println("------------");
		
		Car2 c2 = new Car2();
		c2.carName = "그랜저";
		c2.speed = 180;
		c2.speedUp();
		c2.speedUp();
		System.out.println("차이름:"+c2.carName+" 현재속도:"+c2.speed);
		c2.stop();
		System.out.println("차이름:"+c2.carName+" 현재속도:"+c2.speed);
		
	
	}
}
