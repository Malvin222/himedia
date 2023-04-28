package study2;

public class Test6 {

	public static void main(String[] args) {
		// 배열 구조형성 (세팅개수)
		int[] jumsu = new int[2];
		jumsu[0] = 88;
		jumsu[1] = 80;
		//jumsu[2] = 70;
		
		System.out.println(jumsu.length);
		System.out.println("[0] : " + jumsu[0]);
		System.out.println("[1] : " + jumsu[1]);
		
		int[][] jumsu11 = { {90,80,90},{60,80,50} };
		int[][] jumsu22 = new int[2][3];
		jumsu22[0][0] = 90;
		jumsu22[0][1] = 80;
		jumsu22[0][2] = 90;
	
		jumsu22[1][0] = 60;
		jumsu22[1][1] = 80;
		jumsu22[1][2] = 50;
	
		System.out.println(jumsu11.length); //2
		System.out.println(jumsu11[0].length);//3
		System.out.println(jumsu11[1].length);//3
	
	
	}

}
