package study8;

public class StudentInfo extends StudentVO {
	public int sum() {
	  // int sum=this.eng+this.kor;
		return sum();
	}
	public int avg() {
	//	int result1 = getEng()+getKor()/2;
		return avg();
	}
	public static void main(String[] args) {
		StudentInfo s = new StudentInfo();
		s.setName("김철수");
		s.setYear(1);
		s.setEng(90);
		s.setKor(80);
		
		System.out.println(s.getName());
		System.out.println(s.getYear());
		//System.out.println(sum());
		//System.out.println(avg());
		
		
		
	}
}
