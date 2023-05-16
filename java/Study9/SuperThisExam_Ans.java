package Study9;

class Program1_Ans{
	public void pgName() {
		System.out.println("JAVA");
	}
}
class Program2_Ans extends Program1_Ans{	//상속
	public void pgName() {	//오버라이딩
		System.out.println("JSP");
	}
	public void programAll_Ans() {
		super.pgName();	//상속관계일 경우 부모클래스를 지정 상위클래스 메소드 실행
		this.pgName();
	}
}
public class SuperThisExam_Ans {
	public static void main(String[] args) {
		// 참조 클래스 참조변수 = new 생성자
		Program2_Ans p2 =new Program2_Ans(); //인스턴스 처리
		p2.pgName(); //JSP
		p2.programAll_Ans();//JAVA
	}
	
	
}
