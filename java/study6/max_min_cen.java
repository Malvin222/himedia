package study6;

import java.util.Arrays;

public class max_min_cen {
	public static void main(String[] args) {
		//맥스값
		int[] mam = {100,20,40,500,300};
		System.out.println("가장 큰 값 : " +arrayBig(mam));
		//민 값
		int[] mim = {500,800,7110,54,384,57,90};
		System.out.println("가장 작은 값 : "+arraySmall(mim));
		//중앙값
		int[] cen = {80,20,60,40,100,80};
		System.out.println("중앙 값 : "+arrayCenter(cen));
		//강사님풀이
		int[] n1 = {57,11,33,55,77,17};
		}
	

	//강사님풀이
	public static int arrayIntMax(int[] n1) {
		int max =n1[0];
		for (int n:n1) {
			max = Math.max(max,n);
		}
		return max;
	}
		public static int arrayIntmin(int[] n1) {
			int min =n1[0];
			for (int n:n1) {
				min = Math.max(min,n);
		}
			return min;
	}
	//맥스값 메소드
	public static int arrayBig(int[] a) {
		int max=0;
		for (int i=0;i<a.length;i++) {
			max = Math.max(max,a[i]);
		}
		return max;
	}
	//민 값 메소드
	public static int arraySmall(int[] a) {
		int min=a[0];
		for (int i=0;i<a.length;i++) {
			min =Math.min(min,a[i]);
		}
		return min;
	}
	//중앙값 메소드 
	public static int arrayCenter(int[] a) {
		Arrays.sort(a);
		int len = a.length;
		int center = len/2;
		int result = 0;
		if(len%2 == 0 ) {
			result = (a[center-1]+a[center])/2;
		}else {
			result = (a[center]);
		}
		return result;
	} 
}
