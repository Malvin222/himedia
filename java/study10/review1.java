package study10;

interface review2 {
	public int hap(); //메소드의 명세화
}

class review3 implements review2{
	//멤버변수(메소드 밖에있는 변수),인스턴스변수(객체변수,스태틱 처리되지 않은 변수)
	private String name;	//캡슐화
	private int eng;
	private int kor;
	//멤버변수,클래스변수(전역변수,정적변수)
	static String title;
	public int hap() {	//다형성 -> 오버라이딩
		return eng+kor;
	}
	public int hap(int a,int b) {	//다형성->오버로
		return a+b;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
		}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng=eng;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor=kor;
	}
	}


public class review1 {
	public static void main(String[] args) {
		//참조클래스 참조변수 new 생성자
		review3 aa = new review3(); //생성자
		aa.setName("홍길동");
		aa.setEng(60);
		aa.setKor(80);
		System.out.println(aa.getName());
		System.out.println(aa.getEng());
		System.out.println(aa.getKor());
		System.out.println("합계: "+aa.hap()+" 평균: "+aa.hap()/2);
		
		
	}
}
