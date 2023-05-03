package study5;

public class MathTest1 {

	public static void main(String[] args) {

		//ceil() : 올림모세도(소숫점 아래);
		System.out.println(Math.ceil(98.2));
		System.out.println(Math.ceil(98.7));
		System.out.println("-------------");
		//floor() : 내림메소드(소숫점아래)
		System.out.println(Math.floor(98.2));
		System.out.println(Math.floor(98.7));
		System.out.println("-------------");
		//round() : 반올림메소드 (정수 반환)
		System.out.println(Math.round(98.2));
		System.out.println(Math.round(98.4));
		System.out.println(Math.round(98.5));
		System.out.println(Math.round(98.9));
		System.out.println("--------------");
		//rint() : 반올림메소드 (실수 반환 "0.6" 기준)
		System.out.println(Math.rint(98.2));
		System.out.println(Math.rint(98.5));
		System.out.println(Math.rint(98.6));
		System.out.println("--------------");
		//abs() : 절대값 메소드
		System.out.println(Math.abs(-98));
		System.out.println(Math.abs(98));
		System.out.println("--------------");
		//pow() : 지수 (제곱) 메소드
		System.out.println(Math.pow(10, 2));
		System.out.println(Math.pow(10,3));
		System.out.println("--------------");
		//sqrt() : 제곱근 (루트) 메소드
		System.out.println(Math.sqrt(100));
		System.out.println(Math.sqrt(25));
		System.out.println("--------------");
		//max() / min() : 최댓값 최소값 메소드  수치 2개밖에 못옴
		System.out.println(Math.max(10, 20));
		System.out.println(Math.min(10, 20));
		// 3이상
		System.out.println(Math.max(10, 
						   Math.max(20,
						   Math.max(16,77))));
		System.out.println("--------------");
		//Math.random() : 난수발생 메소드(무작위 수) //정수타입 = 실수타입 (X)
		System.out.println("난수 1:"+Math.random());
		int nansu = (int) (Math.random() *100);
		System.out.println("난수 2 :"+nansu);
		
		
		System.out.println("--------------");
		//[풀어보기 0]
		int n1 = 1000;
		int n2 = 1200;
		int max = Math.max(n1, n2);
		int min = Math.min(n1,n2);
		System.out.println("max: "+max+" / min: "+min);
		System.out.println("--------------");
		//[풀어보기 1]
		int[] a1 = {90,80,-40};
		//int a1_2= Math.abs(a1[2]);
		int hap = 0;
		for(int i=0; i<a1.length; i++) {
			hap += Math.abs(a1[i]);
		}
		int avg = hap/a1.length;
		System.out.println("총합: "+hap+" / 평균: "+avg);
		System.out.println("---------------");
		//[풀어보기 2]
		int[] a2 = {5,45,23,2,34,21};
		int max1=a2[0];
		int min1=a2[0];
		for (int i=0;i<a2.length;i++) {
			max1 = Math.max(max1, a2[i]); 
			min1 = Math.min(min1, a2[i]);
		}
		System.out.println("최대 값: "+max1+" / 최소 값: "+min1);
		System.out.println("----------------");
		
		//[풀어보기 3]
		for (int i=1;i<=6;i++) {
			int loto =(int) ((Math.random()*45)+1);
			System.out.print(loto);
			System.out.print(" ");
			//if (lotto.contain(lotto.val())==true) {
			//	return;
			//}
			// 난수1 -> {난수1,	}
			// 난수2 -> 이전값들과 비교 후{난수1,난수2}
			// ->동일한 값이 있는 경우 다시 새로운 난수2 발생
			// 난수3 -> 이전값들과 비교 후{난수1,난수2,난수3}
			// ->동일한 값이 있는 경우 다시 새로운 난수3 발생
			// 난수 6 입력 후  break;
		}
		System.out.println(" ");
		
			int[] lotto = new int[6];
			int idx = 0;
			while( true ) {
				boolean b1= false;
				int number = (int) (Math.random()*45)+1;
				for(int i=0; i<6;i++) {
					if(number == lotto[i]); b1= true;
				}
				if (b1 ==false) { 
					lotto[idx] = number;
				} else {continue;}
				idx ++;
				if(idx ==6);
				break;
			}
			for(int i : lotto) {
		System.out.print(i + " ");}
	}
}
