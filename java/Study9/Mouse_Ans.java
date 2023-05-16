package Study9;

public class Mouse_Ans extends Product_Ans{
	
		public int discount( ) {	//다형성 -> 오버라이딩(상속관계에서의 기법)
			int result = getPrice() -(getPrice()/5);
			return result;
		}
	
	public static void main(String[] args) {
		
		Mouse_Ans mouse = new Mouse_Ans();
		System.out.println(mouse.getName());
		System.out.println(mouse.getPrice());
		System.out.println(mouse.getMaker());
		
		Mouse_Ans m1 = new Mouse_Ans();
		Mouse_Ans m2 = new Mouse_Ans();
		
		m1.setName("파란마우스");
		m1.setPrice(5000);
		m1.setMaker("미국");
		m2.setName("검정마우스");
		m2.setPrice(6000);
		m2.setMaker("미국");
		
		System.out.println(m1.getName());
		System.out.println(m1.getPrice());
		System.out.println(m1.getMaker());
		System.out.println("할인가격 : "+m1.discount());
		
		System.out.println(m2.getName());
		System.out.println(m2.getPrice());
		System.out.println(m2.getMaker());
	}
}
