package student;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Scanner;

import comm.DbConnect;

public class asdfasdf extends DbConnect{
	
	public static void main(String[] args) throws Exception{
		
		Scanner scn =new Scanner(System.in);
		
		System.out.println("====학생정보 프로그램====");
		System.out.println("1.학생목록 관련 ");
		System.out.println("2.성적조회 ");
		System.out.println("3.학생데이터 임포트 ");
		System.out.println("4.전체 학생 정보 출력 ");
		
		System.out.println("번호를 선택해주세요>>");
		int number = scn.nextInt();
		switch(number) {
			//학생목록관련
			case 1: 
				
				System.out.println("====학생목록 관련====");
				System.out.println("1.정보입력 2.정보변경 3.정보삭제 4.정보출력");
				System.out.println("번호를 선택해주세요>>");
				number = scn.nextInt();
				switch(number) {
					
					case 1:
							studentInsert();
						break;
					
					case 2:
							studentUpdate();
						break;
					
					case 3:
							studentDelete();
						break;
					
					case 4:
							studentInfo();
						break;
					}
				
				break;
			//학생목록관련 끝
				
			//성적조회
			case 2: 
				scoreSearch();
				break;
			//성적조회 끝
			
			//학생 데이터 임포트
			case 3:
				System.out.println("===3.학생 데이터 임포트==");
				System.out.println("1.학생정보 2.학생점수");
				System.out.println("임포트할 정보를 입력해주세요>>");
				number =scn.nextInt();
				switch(number) {
					case 1:
							System.out.println("학생정보 임포트");
							String Info_path = "C:/temp100/StudentInfo.txt";
							studentImport(Info_path);
						break;
					case 2:
							System.out.println("학생점수 임포트");
							String Score_path = "C:/temp100/Studentscore.txt";
							studentImport(Score_path);
						break;
					default : System.out.println("값이 잘못되었습니다.");
					}
				break;
			//학생 데이터 임포트 끝
			
			//학생 전체 출력
			case 4:
				studentAllInfo();
				break;
		}
		
		
	}
	
	public static void studentInsert() throws Exception{
		
		Statement stmt = Connection().createStatement();
		Scanner scn = new Scanner(System.in);
		
		System.out.println("====정보입력====");
		System.out.println("학생정보를 입력해주세요");
		System.out.println("학생아이디>>");
		String userid =scn.next();
		
		//중복체크 sql
		String sql = "select count(*) cnt from student_info where userid='"+userid+"'";
		ResultSet rs1 = stmt.executeQuery(sql);
		int cnt= 0;
		if (rs1.next() ) {
			cnt = rs1.getInt("cnt");
		}else {
			return;
		}
		if(cnt>0) {
			System.out.println("이미 사용중인 학생아이디 입니다.");
			return;
		}
		System.out.println("학생이름>>");
		String name =scn.next();
				
		System.out.println("학교>>");
		String school =scn.next();
		
		System.out.println("생년월일(0000-00-00)>>");
		String birthday = scn.next();
		
		System.out.println("성별(남성:M, 여성:F)>>");
		String gender = scn.next().toUpperCase();
		if(gender.equals("M") || gender.equals("F")) {
			
		}else {
			System.out.println("성별을 M 또는 F 로 작성해주세요");
			return;
		}
		
		//인서트 sql
		String sql2 = "insert into student_info"
						+ "(userid,name,school,birthday,gender) "
						+ "values ('"+userid+"'"
								+ ",'"+name+"'"
								+ ",'"+school+"'"
								+ ",'"+birthday+"'"
								+ ",'"+gender+"')";
		try {
			int result = stmt.executeUpdate(sql2);
			if(result ==1) {
				System.out.println("저장완료");
			}else {
				System.out.println("저장실패");
			}
		}catch(Exception e ) {
				System.out.println("제대로 된 형식이 아닙니다.");
			}
	}
	
	public static void studentUpdate() throws Exception{
		Statement stmt = Connection().createStatement();
		Scanner scn = new Scanner(System.in);
		System.out.println("====정보변경====");
		System.out.println("변경할 학생 정보를 입력해주세요");
		
		System.out.println("학생 아이디>>");
		String userid = scn.next();
		//중복검사 아이디가 있을시 작동
				String sql = "select count(*) cnt from student_info where userid='"+userid+"'";
				ResultSet rs1 = stmt.executeQuery(sql);
				int cnt= 0;
				if (rs1.next() ) {
					cnt = rs1.getInt("cnt");
				}else {
					return;
				}
				if(cnt==0) {
					System.out.println("변경할 학생아이디가 존재하지 않습니다.");
					return;
				}
				
		System.out.println("학생이름>>");
		String name =scn.next();
				
		System.out.println("학교>>");
		String school =scn.next();
		
		System.out.println("생년월일(0000-00-00)>>");
		String birthday = scn.next();
		
		System.out.println("성별(남성:M, 여성:F)>>");
		String gender = scn.next().toUpperCase();
			//성별 에러값 검출
			if(gender.equals("M") || gender.equals("F")) {
				
			}else {
				System.out.println("성별을 M 또는 F 로 작성해주세요");
				return;
			}
		//업데이트 sql문
		String sql2 = "update student_info set "
							+ "name='"+name+"'"
							+ ",school ='"+school+"'"
							+ ", birthday='"+birthday+"'"
							+ ",gender='"+gender+"' "
							+ "where userid='"+userid+"'";
		try {
			int result =stmt.executeUpdate(sql2);
			if(result>0) {
				System.out.println("변경완료");
			}else {
				System.out.println("변경실패");
			}
		}catch (Exception e) {
				System.out.println("제대로 된 형식이 아닙니다.");
			}
	}
	
	public static void studentDelete() throws Exception{
		Statement stmt = Connection().createStatement();
		Scanner scn =new Scanner(System.in);
		System.out.println("삭제할 학생아이디를 입력해주세요");
		String userid = scn.next();
		//아이디 검사
			String sql = "select count(*) cnt from student_info where userid='"+userid+"'";
			ResultSet rs1 = stmt.executeQuery(sql);
			int cnt= 0;
			if (rs1.next() ) {
				cnt = rs1.getInt("cnt");
			}else {
				return;
			}
			if(cnt==0) {
				System.out.println("삭제할 학생아이디가 존재하지 않습니다.");
				return;
			}
		System.out.println("정말 삭제하시겠습니까? 예 / 아니오");
		String ok = scn.next();
		if(ok.equals("예")) {
			String sql2 ="delete from student_info where userid='"+userid+"'";
			stmt.executeUpdate(sql2);
			String sql3 ="delete from student_score where userid='"+userid+"'";
			stmt.executeUpdate(sql3);
			System.out.println("삭제완료");
		}else {
			System.out.println("삭제 중단");
		}
	}
	
	public static void studentInfo() throws Exception{
		Statement stmt = Connection().createStatement();
		Scanner scn =new Scanner(System.in);
		System.out.println("====학생 정보 출력====");
		System.out.println("학생 아이디>>");
		String userid = scn.next();
			//아이디 중복검사
			String sql = "select count(*) cnt from student_info where userid='"+userid+"'";
			ResultSet rs1 = stmt.executeQuery(sql);
			int cnt= 0;
			if (rs1.next() ) {
				cnt = rs1.getInt("cnt");
			}else {
				return;
			}
			if(cnt==0) {
				System.out.println("출력할 학생아이디가 존재하지 않습니다.");
				return;
			}
			
			String sql2="Select userid,name,"
						+ "school,"
						+ "to_char(birthday,'yyyy-mm-dd') birthday"
						+ ",gender "
						+ "from Student_info "
						+ "where userid='"+userid+"'";
			
			ResultSet rs2= stmt.executeQuery(sql2);
			while(rs2.next()) {
				userid = rs2.getString("userid");
				String name = rs2.getString("name");
				String school = rs2.getString("school");
				String birthday = rs2.getString("birthday");
				String gender = rs2.getString("gender");
				System.out.println("아이디\t 학생명\t  소속학교\t 생년월일\t  \t성별");
			
			System.out.println(userid+"\t"+name+"\t"+school+"\t"+birthday+"\t"+gender);
	}
	
	
	}
	
	public static void scoreSearch() throws Exception{
		Statement stmt = Connection().createStatement();
		Scanner scn = new Scanner(System.in);
		System.out.println("조회할 학생 아이디를 입력해주세요");
		System.out.println("아이디>>");
		String userid = scn.next();
			//아이디검사
			String sql = "select count(*) cnt from student_info where userid='"+userid+"'";
			ResultSet rs1 = stmt.executeQuery(sql);
			int cnt= 0;
			if (rs1.next() ) {
				cnt = rs1.getInt("cnt");
			}else {
				return;
			}
			if(cnt==0) {
				System.out.println("조회할 학생아이디가 존재하지 않습니다.");
				return;
			}
		System.out.println("학년>>");
		int grade = scn.nextInt();
		
		System.out.println("학기>>");
		int hakgi =scn.nextInt();
		

		String sql2 ="           select c.*from"
				+ "				   (select b.*,rank()over (order by avg desc) classrank "
				+ "                from (select a.*,rank()over (order by avg desc) schoolrank "
				+ "                from(select i.userid userid,i.name name,i.school school,s.grade grade,s.hakgi hakgi,s.ban ban,round((s.eng+s.kor+s.math)/3) avg,eng,kor,math,(eng+kor+math) hap"
				+ "                    from student_info i,student_score s"
				+ "                    where i.userid=s.userid "
				+ "                            and s.grade='"+grade+"'"
				+ "                            and s.hakgi='"+hakgi+"'"
				+ "                            order by avg desc)a)b"
				+ "                            where ban = (select ban from student_score where userid='"+userid+"' and grade='"+grade+"' and hakgi='"+hakgi+"'))c"
				+ "                            where userid ='"+userid+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		while(rs2.next()) {
			String name =rs2.getString("name");
			String school = rs2.getString("school");
			String eng = rs2.getString("eng");
			String kor = rs2.getString("kor");
			String math =rs2.getString("math");
			String hap = rs2.getString("hap");
			String avg = rs2.getString("avg");
			String classrank = rs2.getString("classrank");
			String schoolrank = rs2.getString("schoolrank");
			
			System.out.println("[성적조회 결과]");
			System.out.println("학생ID: "+userid);
			System.out.println("학생명: "+name);
			System.out.println("소속학교: "+school);
			System.out.println("학년: "+grade+"학년");
			System.out.println("학기: "+hakgi+"학기");
			System.out.println("영어\s 국어\s 수학\s 합계\s 평균\s (반)석차\s (전교)석차");
			System.out.println(eng+"\s   "+kor+"\s "+math+"\s  "+hap+"\s "+avg+"\s    "+classrank+"\s       "+schoolrank);
		}
	}
	
	public static void studentImport(String file_path) throws Exception {
		Statement stmt =Connection().createStatement();
		Calendar cal = Calendar.getInstance();
		long t1 =cal.getTimeInMillis();
		
		FileReader file = new FileReader(file_path);
		BufferedReader buffer =new BufferedReader(file);
		String rowData ="";
		int cnt = 0;
			String Info_path = "C:/temp100/StudentInfo.txt";
			String Score_path = "C:/temp100/Studentscore.txt";
			if(file_path.equals(Info_path)) {
				while(true) {
					if ((rowData =buffer.readLine()) != null) {
						String[] datas = rowData.split(",");
						String sql = "Insert into  Student_Info "
								+ "values( '"+datas[0]
								+"','"+datas[1]
								+"','"+datas[2]
								+"','"+datas[3]
								+"','"+datas[4]+"')";
						int result= stmt.executeUpdate(sql);
						if(result ==1) cnt++;
						System.out.println(sql);
					}else break;
				}
			}else if(file_path.equals(Score_path)) {
				
				while(true) {
					if ((rowData =buffer.readLine()) != null) {
						String[] datas = rowData.split(",");
						String sql = "Insert into Student_Score "
								+ "values ('"+datas[0]
								+"','"+datas[1]
								+"','"+datas[2]
								+"','"+datas[3]
								+" ',"+datas[4]
								+"  ,"+datas[5]
								+"  ,"+datas[6]+")";
								
						int result= stmt.executeUpdate(sql);
						if(result ==1) cnt++;
						System.out.println(sql);
					}else break;
				}//while close	
			}

		cal= Calendar.getInstance();
		long t2 = cal.getTimeInMillis();
		long t3 = t2 -t1;
		System.out.println(t3 + " 밀리 초");
		System.out.println( "총" + cnt + "건 입력완료" );
	}
	
	public static void studentAllInfo() throws Exception{
		Statement stmt = Connection().createStatement();
		System.out.println("====전체 학생 정보====");
		
			String sql="Select userid,name,"
					+ "school,"
					+ "to_char(birthday,'yyyy-mm-dd') birthday"
					+ ",gender "
					+ "from Student_info ";
			ResultSet rs2= stmt.executeQuery(sql);
			while(rs2.next()) {
				String userid = rs2.getString("userid");
				String name = rs2.getString("name");
				String school = rs2.getString("school");
				String birthday = rs2.getString("birthday");
				String gender = rs2.getString("gender");
				System.out.println("아이디\t 학생명\t  소속학교\t 생년월일\t  \t성별");
			
			System.out.println(userid+"\t"+name+"\t"+school+"\t"+birthday+"\t"+gender);
		}
	}

	
}
	