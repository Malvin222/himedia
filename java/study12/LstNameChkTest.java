package study12;

public class LstNameChkTest{
	public static void main(String[] args) {
		String str= "김";
		LstNmChk lstNm = new LstNmChk();
		try {
			lstNm.setLstNm(str);	//체크 담당
			System.out.println(str+"은 올바른 성입니다.");	//오류가 나지 않은 경우
		}catch (InvalidNmException e){	
			System.out.println(e.toString());	//오류가 난 경우
		}
		
	}
	
}
