package study11;

public class MatchesTest1 {
	public static void main(String[] args) {
		//임의의 문자가 존재 존재시 true , 부재시 false
		String title = "1";
		String pattern = ".+";
		System.out.println(title.matches(pattern));
	
		String color1 = "red";
		String color2 = "ared";
		String color3 = "redabc";
		String color4 = "read";
		pattern = "^red.*";	//시작 문자열
		System.out.println(color1.matches(pattern));
		System.out.println(color2.matches(pattern));
		System.out.println(color3.matches(pattern));
		System.out.println(color4.matches(pattern));
		
		String color5 ="yellow";
		String color6 ="green";
		System.out.println(color5.matches(pattern));
		System.out.println(color6.matches(pattern));
		
		String gender ="M";
		pattern = "^(M|F)";	//시작 문자 r or y or b
		System.out.println(gender.matches(pattern));
		
		//숫자만
		String date ="20201225";
		//숫자로 시작하고, 숫자 1개이상,숫자로 끝나야함
		pattern = "^[0-9]+$";
		System.out.println(date.matches(pattern));
		//영문만
		String str = "a1bc";
		//영문으로 시작하고, 영문 1개이상, 영문으로 끝나야함
		pattern = "^[a-zA-Z]+$";
		System.out.println(str.matches(pattern));
	}
}
