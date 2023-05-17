package study14;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class study13_review {
	//메소드로 작성
	public	static void test1(List<Map> list1 ) {	//List<Map>클래스 ->list1 변수
		
		int view=0;
		for(int i=0;i<list1.size();i++) {
			//강사님풀이 
			 //(- 제거)
			 String rdate =(String)list1.get(i).get("rdate"); //rdate값을 가져와서 String 변환
			 rdate = rdate.replace("-","");	//rdate 값 치환
			 list1.get(i).put("rdate",rdate);	//list1의 reda값을 새롭게 저장
			 
			 //(조회수 +100)
			 String hit = (String)list1.get(i).get("hit"); //hit값 String 변환
			 int hit2 = Integer.parseInt(hit) +100;	//hit 값 +100 연산
			 list1.get(i).put("hit",hit2);	
			 
			 //(총 조회수)
			 view +=hit2;
		}	//for 문 끝
		System.out.println("총 조회수 : " +view + "건");
		System.out.println("조회수 평균 : "+view/list1.size()+ "건");
	}	// test1 메소드 끝

	public static void main(String[] args) {
		List<Map>list = new ArrayList<Map>();	//자바 내장 유틸 ArrayList 불러옴
		Map<String,String> board= new HashMap<String,String>();	//자바 내장 유틸 HashMap 불러옴
		board.put("no", "1");
		board.put("hit", "35");
		board.put("rdate", "2021-05-01");
		board.put("name", "홍길동");
		board.put("title", "공지사항1");
		list.add(board);
		
		board = new HashMap<String,String>();
		board.put("no", "2");
		board.put("hit", "3");
		board.put("rdate", "2021-05-05");
		board.put("name", "제임스");
		board.put("title", "공지사항2");
		list.add(board);
		
		test1(list);	//test1 메소드 실행문
		
		}
}
