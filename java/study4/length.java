package study4;

public class length {

	public static void main(String[] args) {
		String subject = "Html,mysql,java";

		System.out.println(subject);
		System.out.println(subject.replace("mysql","oracle"));
		System.out.println(subject.length());
		String subject2 = subject.trim();
		System.out.println(subject2);
		System.out.println(subject.substring(11,15));
		System.out.println(subject.indexOf(","));
		System.out.println(subject.contains("javascript"));
		System.out.println(subject.charAt(5));
		String[] subject3 = subject.split(",");
		System.out.println(subject3[1]);
		System.out.println("------------");
		
		String title="자바프로그래밍 입문";
		String content="를 이용하여 기초부터 중급까지 완성한다.";
		String s1 = "";
		if(title.contains("자바")==true && content.contains("자바") ==true) {
			 s1 = "모두 포함되었습니다.";
		} else if (title.contains("자바")==true || content.contains("자바") ==true) {
			 s1 = "한쪽만 포함되었습니다";
		} else { s1 = "모두 포함 되지 않았습니다.";}
		System.out.println("자바라는 단어가 "+s1);
	}

}
