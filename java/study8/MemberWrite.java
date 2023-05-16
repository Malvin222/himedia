package study8;

public class MemberWrite {
	public static void main(String[] args) {
		MemberVO vo= new MemberVO();
		vo.setUserid("abc");
		vo.setPass("123");
		vo.setName("홍길동");
		vo.setGender("A");
		vo.setBirthday("2222-22-22");
		System.out.println(vo.getUserid());
		System.out.println(vo.getPass());
		System.out.println(vo.getName());
		System.out.println(vo.getGender());
		System.out.println(vo.getBirthday());
	}
}
