package study2;

public class Test4 {

	public static void main(String[] args) {
		//var color = ["","",""];
		//문자열 타입의 배열, 숫자타입의 배열
		String[] color = {"blue","yellow","green"};
		//String[] str = {"aa","bb",77}; //타입 혼합 불가
		byte[] a1 = {50,60,70};
		short[] a2 = {60,90,100};
		int[] a3 = {98,88,92};
		long[] a4 = {1000L,3000L,5000L};
		
		System.out.println(a1); //
		System.out.println(a1[0]+a1[1]+a1[2]); 
		System.out.println("long : "+a4[0]); //
		//System.out.println("long : "+a4[5]);
		
		float[] f1 = {70.7f, 44.7f,100.0f};
		System.out.println("float : "+ f1[0]);
		
		double[] d1 = {77.7,33.3,99.5};		
		double d2 =12;
		System.out.println("double : " + d2);
		
		System.out.println();
	
		int[] score = {90,80,88,10,30,80,76};
		int hap = 0;
		int avg = 0;
		hap += score[0];
		hap += score[1];
		hap += score[2];
		hap += score[3];
		hap += score[4];
		hap += score[5];
		
		avg = hap/score.length;
		
		System.out.println("합계 : "+hap+",평균:"+avg);
		
		
	}
}
