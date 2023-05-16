package study8;

public class Program2 extends Program1{
	public void pgName() {
		System.out.println("JSP");
	}
	public void programAll() {
		super.pgName();
		this.pgName();
	}
}
