package Study9;

public class StudentInfo_Ans extends StudentVO_Ans {
		public int sum() {
			return getEng()+getKor();
		}
		public int avg() {
			return sum()/2;
		}
		public static void main(String[] args) {
			StudentInfo_Ans s1 = new StudentInfo_Ans();
			s1.setName("김철수");
			s1.setYear(1);
			s1.setEng(90);
			s1.setKor(80);
			
			System.out.println(s1.getName());
			System.out.println(s1.getYear());
			System.out.println(s1.sum());
			System.out.println(s1.avg());
			
		}
}	
