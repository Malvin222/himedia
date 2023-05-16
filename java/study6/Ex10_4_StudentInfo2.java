package study6;

public class Ex10_4_StudentInfo2 {
	
		public static void main(String[] args) {
			//참조 클래스 참조변수 = new 생성자()
			Ex10_4_Calc calc =new Ex10_4_Calc(); //인스턴스(객체)화
			calc.score1 = 70;
			calc.score2 = 80;
			
			System.out.println(calc.score1);
			System.out.println(calc.score2);
			System.out.println(calc.hap());
		}
}
