package study1;

public class Test5 {

	public static void main(String[] args) {
		// 150 + 7 = 157
		int a = 150;
		int b = 7 ; 
		System.out.println(a+"+"+b+"="+(a+b));	//150+7=157
		System.out.println(a+"-"+b+"="+(a-b));
		System.out.println(a+"*"+b+"="+(a*b));
		System.out.println(a+"/"+b+"="+(a/b)); 	//21
		System.out.println(a+"%"+b+"="+(a%b));	//나눈 나머지 값
			
		String firstName= "길동";
		System.out.println(firstName);
		
		System.out.println("홍"+firstName);
		System.out.println("김 "+ firstName);
		System.out.println("홍"+firstName + "100점");
		System.out.println("-------------");
		
		
		String fruit = "사과";
		int price = 500;
		System.out.println(fruit+"의 가격은"+price+"원 입니다.");
		System.out.println("-------------");
		
		int eng = 90;
		int math = 100;
		System.out.println("영어("+eng+") 수학("+math+") 평균("+((eng+math)/2)+")");
	
		System.out.println((eng>80)?"우수":"양호");
	
	}

}
