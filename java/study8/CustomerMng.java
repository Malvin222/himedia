package study8;

public class CustomerMng {
	public static void main(String[] args) {
		Customer2VO c =new Customer2VO();
		c.setName("이방인");
		c.setPhone("010-111-2222");
		c.setAge(30);
		c.setAddress("서울 강남");
		System.out.println(c.getName());
		System.out.println(c.getAge());
		System.out.println(c.getAddress());
	}
}
