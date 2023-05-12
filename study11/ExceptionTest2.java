package study11;

public class ExceptionTest2 {
	public static void main(String[] args) {
		/*
		//예제 4
		
		int n1 = 10;
		int n2 = 0;
		int[] n3= {11,22};
		try {
			//int result = n1/n2;//error			
			//cahch에 예외 에러명을 세팅
			System.out.println(n3[10]);
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("zero error");
			
		}*/
		
		//예제5
		String[] pgName = {"JAVA","PHP","ASP"};
		int i=0;
		while(i<5) {
			try {
				if(i==4)System.out.println(i/0);
				else System.out.println(pgName[i]);
			}catch(ArrayIndexOutOfBoundsException a) {
				System.out.println("array exception");
			}catch(Exception e) {
				System.out.println("zero error");
			}finally {					//finally 정상코드,에러코드 상관없이 매번 출력;
				System.out.println("finally");
			}
			i++;
		}
	
	
		
	}
}
