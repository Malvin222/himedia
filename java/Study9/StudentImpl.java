package Study9;

public class StudentImpl extends StudentService {
	private String name;
	private int eng;
	private int kor;
	
	public int sum() {
		return  eng+kor;
	}
	public int avg() {
		return sum()/2;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	
	
}
