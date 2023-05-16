package study5;

public class loop10 {
	
	
	public static void loop10() {
		for (int i=1; i<10; i++) {
			System.out.print(i+" ");
		}
	}
	
	public static void loop10_1() {
		int i=1;
		while(i<10) {
			System.out.print(i+" ");
			++i;
		}
	}
	public static void loop20() {
		for(int i=1;i<=20;i++) {
			System.out.print(i+" ");
		}
	}
	public static void loop20_1() {
		int i =1 ;
		while(i<=20) {

			System.out.print(i+" ");
			i++;
		}
	}
	public static void main(String[] args) {
		loop10();
		System.out.println();
		loop20();
		System.out.println();
		loop10_1();
		System.out.println();
		loop20_1();
		
	}

}
