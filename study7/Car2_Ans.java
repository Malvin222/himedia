package study7;

public class Car2_Ans {

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
		Car2_Ans sonata = new Car2_Ans();
		
		sonata.carName = "소나타";
		sonata.speed = 100;
		sonata.speedUp();
		sonata.speedUp();
		System.out.println
		("차이름: "+sonata.carName+", 속도: "+sonata.speed);
		
		Car2_Ans granduer = new Car2_Ans();
		granduer.carName = "그랜저";
		granduer.speed = 200;
		granduer.speedUp();
		granduer.speedUp();
		System.out.println
		("차이름: "+granduer.carName+", 속도: "+granduer.speed);
	}
}
