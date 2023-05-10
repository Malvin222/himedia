package Study9;

public class StudentControl {
	public static void main(String[] args) {
		int avg = 0;	//지역변수
		StudentImpl s1 = new StudentImpl();
		s1.setName("홍길동");
		s1.setKor(50);
		s1.setEng(70);
		
		avg =s1.sum()/2;
		
		System.out.println("이름 : "+s1.getName());
		System.out.println("국어점수: "+s1.getKor());
		System.out.println("영어점수: "+s1.getEng());
		System.out.println("합계: "+s1.sum());
		System.out.println("평균: "+avg);
	}
}
