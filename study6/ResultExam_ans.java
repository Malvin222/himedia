package study6;

import java.util.Arrays;

public class ResultExam_ans {
	public static void main(String[] args) {
		int kor = 80;
		int eng = 100;
		System.out.println
		("국어:"+kor+", 영어:"+eng+" 결과는 "+ResultExam_ans.abc(kor,eng));
		int[] score = {99,77,22,70,88,60,70,30};
		int avg = arraySum(score)/score.length;
		System.out.println
		("합계:"+arraySum(score)+", 평균:"+avg);
	
	}
	//{60,70,80} ->210
	public static int arraySum(int[] a) {
		//int[] a = {60,70,80}
		int sum = 0;
		for (int i=0;i<a.length; i++) {
			sum += a[i];
		}
		return sum;
	}
	
	// return => 합격 /불합격 /재시험 
	public static String abc(int a,int b) {
		String str = "";
		if(a>=60 && b>=60) str="합격";
		else if(a<60 && b<60) str="불합격";
		else str="재시험";
		
		return str;
	}
	
}