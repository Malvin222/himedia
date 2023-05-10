package Study9;

public class CarVolMake implements CarVolService{
	private int volLevel;
	private int volLevelTemp;
	public int getVolLevel() {
		return volLevel;
	}
	public int getVolLevelTemp() {
		return volLevelTemp;
	}
	public void setVolLevelTemp(int volLevelTemp) {
		this.volLevelTemp = volLevelTemp;
	}
	public void setVolLevel(int volLevel) {
		this.volLevel = volLevel;
	}
	public void volUp(int level) {
		volLevel+=level;
	}
	public void volDown(int level) {
		volLevel -=level;
	}
	public void volOff() {	//0
		volLevel = 0;
	}
	public void volPause() {	//일시중지 -> 17
			volLevelTemp = volLevel;
			volLevel=0;
	}
	public void volResume() {	//재시작 ->
		volLevel=volLevelTemp;
		volLevelTemp=0;
		
	}
}