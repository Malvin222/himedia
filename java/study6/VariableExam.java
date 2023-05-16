package study6;
class Score{
	int kor;
	int eng;
}
public class VariableExam {
	public static void main(String[] args) {
		Score score = new Score();	//참조변수는 일반적으로 클래스 이름으로 셋팅
		score.kor=100;
		score.eng=90;
		int hap = score.kor+score.eng;
		int avg = hap/2;
		System.out.println
		("국어:"+score.kor+", 영어:"+score.kor+", 평균:"+avg);
	}
}
