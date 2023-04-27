package study1;

public class Test7 {

	public static void main(String[] args) {
		
		int a = 1;
		++a;	//2
		++a;	//3
		a++;	//4
		System.out.println(a);	//4
		System.out.println("-----------");
		
		int b = 1;
		++b;		//2
		//int c = ++b; // int c = 3;
		int c = b++;  //b가 먼저 넘어가고 1더해짐  우선순위가 등호에 ++가 밀림
		System.out.println("b = " + b ); // 3
		System.out.println("c = " + c ); // 3
		System.out.println("-----------");
		
		int num = 1;
		// 1증가
		num++;
		++num;
		num = num+1;
		num+=1;
		// 2증가
		num = num+2;
		num += 2;
		// 2곱셈
		num = num*2;
		num *= 2;
		// 2나누기
		num = num/2;
		num /= 2;
		System.out.println("-----------");
		System.out.println("-----------");
		
		System.out.println((100>100)?"참":"거짓");
		System.out.println("-----------");
		
		String result = ((10%2==0)?"참":"거짓");
		System.out.println(result);
		System.out.println("-----------");
		
		int apple = 88;
		String result1 = (apple > 80)?"A등급":"B등급";
		System.out.println("사과의 당도는 "+apple+"으로 "+result1+"입니다.");
		System.out.println("-----------");
		
		int eng = 80;
		System.out.println((eng>80)?"우수":"양호");
		System.out.println("-----------");
		
		int gender =  1;
		System.out.println((gender==1)?"남성":"여성");
		System.out.println("-----------");
		
		int number =10;
		if(number>0) {
			System.out.println("양수");
		} else if (number==0) {
			System.out.println("0");
		} else {
			System.out.println("음수");
		}
		//System.out.println((number>0)?"양수":"음수");
		System.out.println("-----------");
		
		int score = 73;
		if(score>=90) {
			System.out.println("A학점");
		} else if(score>=80) {
			System.out.println("B학점");
		}else if (score>=70) {
			System.out.println("C학점");
		}else if (score>=60) {
			System.out.println("D학점");
		}else  {
			System.out.println("F학점");
		}
		
		
	}

}
