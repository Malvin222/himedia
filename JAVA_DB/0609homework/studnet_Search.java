package student;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Scanner;

import comm.DbConnect;

public class studnet_Search extends DbConnect{
	
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
						break;
					case 2:
						break;
					case 3:
						break;
					case 4:
						break;
					}
				
				break;
			//학생목록관련 끝
				
			//성적조회
			case 2: 
				
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
				break;
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
	
	
}
