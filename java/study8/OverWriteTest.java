package study8;
class JavaView{
	public void viewName() {
		System.out.println("자바 프로젝트");
	}
	String viewSeoul() { //void 없음 : return 키워드 반드시 셋팅
		return "강남";
	}
}
class OracleView extends JavaView{
	//같은 메소드이름을 붙일 수 있으며 하위 클래스의 메소드가 상위클래스의 메소드를 덮어씌움 오버라이딩;
	//다형성 -> 오버라이딩(상속관계에서 상위 클래스의 메소드를 다시 정의 하는 기법)
	public void viewName() {	//상위 클래스의 메소드를 덮어씌움
		System.out.println("오라클 프로젝트");
	}
	//다형성 -> 오버로딩(같은 이름의 메소드를 매개변수를 달리하여 작성하는 기법)
	public void viewName(String a) {
		System.out.println("오라클프로젝트");
	}
	String viewBusan() {
		return "부산";
	}
}
public class OverWriteTest {
	public static void main(String[] args) {
		OracleView oracle = new OracleView();
		oracle.viewName();	//오라클 프로젝트
		System.out.println(oracle.viewSeoul()); //강남
		System.out.println(oracle.viewBusan()); //부산
		}
}
