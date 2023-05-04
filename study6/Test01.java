package study6;

public class Test01 {
	public static void main(String[] args) {
		
		boolean power = false;
		int channel = 0;
		
		System.out.println(power); //false;
		
		power = !power;
		channel = 11;
		System.out.println(power); //true;
		System.out.println(channel); //11
	}
}
