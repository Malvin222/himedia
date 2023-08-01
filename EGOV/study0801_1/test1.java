package egov.mywork1.web;

public class test1 {
	public static void main(String[] args) {
		String pass1 = "1234";
		String pass2 = myEncrypt.testMD5(pass1);
		
		System.out.println(pass2);
	}
	
}
