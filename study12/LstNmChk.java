package study12;

public class LstNmChk {
	//멤버변수,클래스변수,상수변수(재정의불가)
	public static final String[] lstNmArr = {
		"김","이","박","조","최","송","허","왕","양","나","차","유","마"};
	//void return 없는 메소드, throws 호출된곳에 예외처리의 강제의무 부과
	void setLstNm(String lastName) throws InvalidNmException{
		if(!IsLstNm(lastName)) {	//false가 왔을 때 예외처리함 ->if문이 false가 되면 실행되지 않음
			throw new InvalidNmException();
		}
	}
	// 접근지정자  리턴타입 (true or false) 메소드명(매개변수)
	private boolean IsLstNm(String str) {	// String str = "최";
		boolean tf = false;
		for(int i=0;i<lstNmArr.length;i++) {
			if(lstNmArr[i].equals(str)) 
				tf=true;	//같은 성이 존재하는 경우, true
		}
		return tf;
		//같은 성이 존재하지 않는 경우, true를 던지고 메소드 종료

	}
}
