package study8;
/*
 * 아이디 userid 6~12	->메세지 출력
 * 암호 pass 4~20 ->메세지 출력
 * 이름 name
 * 성별 gender M , F->메세지출력
 * 생년월일 birthday  2020 - 12-25 10자리가 아닌경우 ->날짜 입력오류 
 */
public class MemberVO {
	private String userid;
	private String pass;
	private String name;
	private String gender;
	private String birthday;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		userid = userid.trim();
		if(userid.length()<6||userid.length()>12) {
			userid = "아이디 입력오류";
		}
		this.userid = userid;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		pass=pass.trim();
		if(pass.length()<=4||pass.length()>=20) {
			pass="비밀번호 입력오류";
		}
		this.pass=pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
	}
	public String getGender() {
		if(!gender.equals("M")&&!gender.equals("F")) {
			gender ="성별입력오류";
		}
		return gender;
	}
	public void setGender(String gender) {
		this.gender=gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void  setBirthday(String birthday) {
		if (birthday.length()!=12) {
			System.out.println("생년월일은 10자리여야 합니다.");
		}
		if (birthday.contains("-")==false) {
			System.err.println("생년월일에 - 이 없습니다.");
		}
		this.birthday=birthday;
	}
}
