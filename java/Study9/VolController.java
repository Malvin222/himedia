package Study9;

public class VolController {
	public static void main(String[] args) {
		VolMake tv = new VolMake();
		VolMake radio = new VolMake();
		System.out.println(tv.getVolLevel());
		System.out.println(radio.getVolLevel());
		tv.volUp(10);
		radio.volUp(30);
		tv.volDown(5);
		radio.volDown(20);
		System.out.println(tv.getVolLevel());
		System.out.println(radio.getVolLevel());
	}
}
