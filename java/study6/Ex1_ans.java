package study6;

public class Ex1_ans {

	public static void main(String[] args) {
		roomSize(22);
		System.out.println("115평방 미터는 "+ roomSize3(115)+"평 입니다.");
		System.out.println("115평방 미터는 "+ roomSize2(115)+"평 입니다.");
	}
	public static double roomSize2 (int size) {
		double result =size * 0.3025;
		return result;
	}
	public static int roomSize3 (int size) {
		double result = size * 0.3025;
		return (int) result;
	}
	public static void roomSize(int size) { //매개변수
		// round (.5) / rint(.6)
		double result = Math.rint(size * 0.3025);  //실수 형태
		double result2 =size * 0.3025;			   //정수 형태
		// 115
		//System.out.println("입력하신 "+size+"평방미터는 "+Math.round(result)+"평 입니다.");
		System.out.println("입력하신 "+size+"평방미터는 "+result+"평 입니다.");
		System.out.println("입력하신 "+size+"평방미터는 "+Math.round(result2)+"평 입니다.");
	}
	
	
}
