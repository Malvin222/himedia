package study11;

public class Matchse_Exm {
	public static void main(String[] args) {
		//예제1
		String birthday ="1980-02-22";
		String pattern = "[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}";
		if (birthday.matches(pattern)) {
			System.out.println("올바른 날짜");
			}else {System.out.println("올바른 날짜 아님");}
		
		
		//예제2 특정단어 검색
		String str = "공지사항 게시판 이미지";
		pattern = ".*게시판.*";
		if(str.matches(pattern)) {
			System.out.println("문자열 있음");
		}else System.out.println("문자열 없음");
		
		
		//예제3 숫자 유무체크
		String txt1 = "432534";
		pattern = ".*[0-9]*.";
		if(txt1.matches(pattern)) {
			System.out.println("숫자있음");
		}else {System.out.println("숫자없음");
		}
		
		
		
		//예제4 핸드폰 번호 체크
		String phone = "010-222-1234";
		pattern = "01(0|1|[6-9])-[0-9]{3,4}-[0-9]{4}";
		if(phone.matches(pattern)) {
			System.out.println("올바른 핸드폰 번호");
		}else {
			System.out.println("핸드폰번호를 다시 확인해주세요.");
		}
		
		
		//예제5 한글체크
		String name = "홍길동";
		pattern = "[가-힣]+";
		boolean result = name.matches(pattern);
		System.out.println("이름체크: " +result);
		
		
		//이메일체크
		//영문+숫자,-,_
		//(영문으로 시작) ( 영,숫,-,_)1개 이상@
		String email1 ="abc@naver.com";
		String email2 = "#abc@korea.co.kr";
		String email3 = "abc@korea";
		pattern ="^[a-zA-Z]+[a-zA-Z0-9_-]*@[a-zA-Z0-9]+\\.[a-zA-Z]+$";
		System.out.println(email1.matches(pattern));
	
		//회원 아이디체크 (영문,숫자,특수문자(_,-,)를 포함한 6~12자)
		String userid = "aaa";
		pattern = "^[a-zA-Z]([a-zA-Z0-9_-]+){6,12}";
		System.out.println("아이디: "+userid.matches(pattern));
		
		
		//회원명 체크(한글 또는 영문으로 2~50자)
		name="Tom";
		pattern = "^[a-zA-Z가-힣]{2,50}$";
		System.out.println("이름 :"+name.matches(pattern));
		
		//학점체크 (A~D,F,+,_)
		//A~F 1개 올수있고, + 또는 -가 올수있고 안올수있다.
		String hakjum ="A+";
		pattern = "(A|B|C|D|F){1}(\\+|-)";
		System.out.println("학점: "+hakjum.matches(pattern));
		
		//공백여부체크
		String content = "ccadsdf";
		pattern = "\\S+";	//공백이아님
		System.out.println("content: "+content.matches(pattern));
	}
}
