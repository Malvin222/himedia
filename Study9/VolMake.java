package Study9;

public class VolMake implements VolService {
	private int volLevel;
	
	public VolMake() {	//생성자
		volLevel = 1;
	}
	public void volUp(int level) {
		volLevel +=level;
	}
	public void volDown(int level) {
		volLevel -=level;
	}
	public int getVolLevel() {
		return volLevel;
	}
	public void setVolLevel(int volLevel) {
		this.volLevel = volLevel;
	}

	
}
