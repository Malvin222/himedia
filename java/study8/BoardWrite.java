package study8;

public class BoardWrite {
	public static void main(String[] args) {
		BoardVO vo = new BoardVO();
		vo.setTitle("첫글입니다.");
		vo.setName(" 홍 길 동 ");
		vo.setPass(" 1 2 3 54");
		vo.setContent(" a b c ");
		vo.setEmail(" a a a");
		
		System.out.println("제목: "+vo.getTitle());
		System.out.println("이름: "+vo.getName());
		System.out.println("암호: "+vo.getPass());
		System.out.println("내용: "+vo.getContent());
		System.out.println("이메일: "+vo.getEmail());
		
	}
}
