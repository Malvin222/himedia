package Study9;

class Customer1VO_Ans {
	private String name;
	private int year;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
}
class Customer2VO_Ans  extends Customer1VO_Ans{
	private String phone;
	private int age;
	private String address;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone=phone;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age=age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address=address;
	}
}
public class CustomerMng_Ans {
	public static void main(String[] args) {
		Customer2VO_Ans c =new Customer2VO_Ans();
		c.setName("이방인");
		c.setPhone("010-111-2222");
		c.setAge(30);
		c.setAddress("서울 강남");
		System.out.println(c.getName());
		System.out.println(c.getAge());
		System.out.println(c.getAddress());
	}
}
