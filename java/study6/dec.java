package study6;

public class dec {
	public static void main(String[] args) {
		// 소숫점 자리 아래 자리수 조율
		double a1 = 12.12345712;
		double result1 = myPoint(a1,2);
		double result2 = myPoint(a1,3);
		double result3 = myPoint(a1,8);
		System.out.println(result3);
		
	}
						//myPoint(a1,2)
	public static double myPoint(double a1,int p1) {
		//	2자리 -> a1 *100; ->1111.11111
		//		 ->/100; ->12.12
		//  3자리 -> a1 * 1000; -11111.1111
		// 		 -> /1000; ->11.111
		// Math.pow (10,1):10^1 , (10,2):10^2	
		
		//int a2 = (int) (a1 * 100); //1212
		//double a3 = a2/(double) 100)); //12.12
		int a2 = (int) (a1 * Math.pow(10, p1)); //1212
		double a3 = a2/(double)Math.pow(10, p1); //12.12
		return a3;
	}
	
}
