package study2;

public class array1 {

	public static void main(String[] args) {
		
		int[][] engs = {{30,80,90},{60,70,90}};
		System.out.println(engs[0][0]); //30
		System.out.println(engs[0][1]); //80
		System.out.println(engs[0][2]); //90
		
		System.out.println(engs[1][0]); //60
		System.out.println(engs[1][1]); //70
		System.out.println(engs[1][2]); //90
		
		System.out.println("-----------");
		
		int[][] kors = {{30,80,90},{60,70,90},{50,20,70,50}};
	
		int[][][] scores = { { {70,90,50} },{ {50,20,70} } };
		
		//1차원 배열
		int [] jumsu = {30,90,90};
		//2차원 배열
		int[][] grader1 = {{30,80,90},{50,20,70,50}};
		//3차원 배열
		int[][][] school = {{ {30,80,90},{50,20,70} },
				{ {70,90,50},{50,20,70,},{70,90,80} }};
		
		// 2학년 2반 1번 학생 점
		System.out.println( school[1][1][0]);
		// 1학년 1반 3번 학생 점
		System.out.println( school[0][0][2]);
		// 2학년 3반 2번 학생 점
		System.out.println( school[1][2][1]);
		
	}
}
