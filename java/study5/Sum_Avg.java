package study5;

public class Sum_Avg {

	public static void main(String[] args) {
		int a = 90;
		int kor = 88;
		mySum(a,kor);
		myAvg(a,kor);
	}
	public static void mySum(int eng,int kor) {
		int hap =eng + kor;
		System.out.println(hap);
	}
	public static void myAvg(int eng,int kor) {
		int avg = (eng+kor)/2;
		System.out.println(avg);
	}
}
