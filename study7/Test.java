package study7;

public class Test {
	public static int my_sum(int a,int b,int c) {
		int result = a+b+c;
		System.out.println(result);
		return result;
	}
	public static  String[] tr(String a) {
		String[] str =a.split(" ");
		for (int i=0;i<str.length;i++) {
			System.out.print(str[i]);
			System.out.println();
		}
		return str;
	}
		
	public static double dd(double d) {
		int d1 = (int)d ;
		double d2 =d-d1;
		
		System.out.println("정수:"+d1+"/실수:"+ d2);
		return d2;
	}
	public static  String number(String i){
		
		String number = i;
		String [] n1 = number.split("-");

		if(n1[0].length() !=6 || n1[1].length() !=7) {
			System.out.println("잘못된 입력값입니다.");
		}else{System.out.println("정상");}
		String age = n1[0].substring(0,2);
		
		String gender = "";
		if(n1[1].substring(0,1) =="1"||n1[1].substring(0,1) =="3") {
			gender = "남성";
		}else if (n1[1].substring(0,1) =="2"||n1[1].substring(0,1) =="4") {
			gender = "여성";
		}
		return number;
		//System.out.println("-나이 : "+n1[0].substring(0,2));
		//System.out.println("-성별 : "+gender);
		//System.out.println("-생일 : ");
		
	}

	public static void main(String[] args) {
		my_sum(10,20,30);
		
		tr("우리 모두의 백과 사전");
		
		dd(11.3252);
		number("951212-1234567");
	}
}