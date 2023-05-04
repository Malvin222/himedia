package study6;


class Bookinfo{
	int price =10000;
	String title = "JAVA 기초";
}

//public은 해당 파일에 클래스가 여러개 있을경우 메인격에만 붙임
public class ObjectTest1 {
	
	int a = 10; //메소드 밖에서 변수 세팅가능
	int b = 10;
	
	public static void main(String[] args) {
		// Scanner scn = new Scanner();  클래스이름 변수명 = new 클래스이름
		//참조클래스 참조변수 = new 생성자
		ObjectTest1 t1 = new ObjectTest1();	//클래스 초기화 	
		System.out.println(t1.a/t1.b);
		
		Bookinfo info = new Bookinfo(); //인스턴스 (객체)화 
		System.out.println(info.title+" : "+info.price);
		
	}
	
}
