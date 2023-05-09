package study8;

class CherryInfo{
	//멤버 변수, 클래스변수
	static String name = "체리";
	static int price = 5000;
	static void discount() {
		price = price -(price/10);
	}
}
//멤버 변수, 인스턴스변수
class AppleInfo{
	String name="사과";
	int price =3000;
	void discount() {
		price = price-(price/10);
	}
}
public class MyFruit extends AppleInfo{	//생성자 없이 extends로 불러옴 (CherryInfo 상속 받음)
	public static void main(String[] args) {
		MyFruit info =new MyFruit();
		System.out.println(info.name + ":"+info.price);
		info.discount();
		System.out.println(info.name + ":"+info.price);
	}
}
