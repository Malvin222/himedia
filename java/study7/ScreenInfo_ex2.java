package study7;

public class ScreenInfo_ex2 {
	String movieTitle ="";	//인스턴스 변수
	int ticketPrice =10000;
	
	public ScreenInfo_ex2(String movieTitle){
		this.movieTitle = movieTitle;
	}
	
	public ScreenInfo_ex2(String movieTitle, int ticketPrice) {
		this.movieTitle = movieTitle;
		this.ticketPrice = ticketPrice;
	}
	public static void main(String[] args) {
		ScreenInfo_ex2 info1 = new ScreenInfo_ex2("미이라");
		ScreenInfo_ex2 info2 = new ScreenInfo_ex2("아마존",15000);
		System.out.println("screen 1의 영화제목은 "+info1.movieTitle);
		System.out.println("screen 2의 영화제목은 "+info2.movieTitle);
		System.out.println("screen 1의 가격은 "+info1.ticketPrice);
		System.out.println("screen 2의 가격은 "+info2.ticketPrice);
	}
}
