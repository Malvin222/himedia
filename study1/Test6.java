package study1;

public class Test6 {

	public static void main(String[] args) {
		
		int number = 1;
		System.out.println(number);
		number = number +1;
		System.out.println(number);
		
		int myMoney = 1000;
		myMoney = myMoney+100;
		System.out.println("내 돈 현황"+myMoney);
		myMoney = myMoney +50;
		System.out.println("내 돈 현황"+myMoney);
		myMoney = myMoney -30;
		System.out.println("내 돈 현황"+myMoney);
		int yourMoney = 500;
		myMoney = myMoney+yourMoney;
		yourMoney = yourMoney-500;
		System.out.println("내 돈 현황"+myMoney);
		System.out.println("---------------");
		
		int TomsMoney = 100;
		int day1 = 20;
		TomsMoney = TomsMoney + day1;
		int day2 = 30;
		TomsMoney = TomsMoney + day2;
		int day3 = -10;
		TomsMoney = TomsMoney +day3;
		int sum = day1 + day2 + day3;
		int avg = sum/3;
		System.out.println("Tom의 총 금액은"+TomsMoney+"만원입니다.");
		System.out.println("평균수입은 "+avg+"만원입니다.");
	}

}
