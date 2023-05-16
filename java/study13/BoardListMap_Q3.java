package study13;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class BoardListMap_Q3 {
	public static void main(String[] args) {
		List<Map>list = new ArrayList<Map>();
		Map<String,String> board= new HashMap<String,String>();
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
		int view=0;
		for(int i=0;i<list.size();i++) {
			/*강사님풀이 
			 * (- 제거)
			 * String rdate =(String)list1.get(i).get("rdate"); //rdate값을 가져와서 String 변환
			 * rdate = rdate.replace("-","");	//rdate 값 치환
			 * list.get(i).put("rdate",rdate);	//list1의 reda값을 새롭게 저장
			 * 
			 * (조회수 +100)
			 * String hit = (String)list1.get(i).get("hit"); //hit값 String 변환
			 * int hit2 = Integer.parseInt(hit) +100;	//hit 값 +100 연산
			 * list.get(i).put("hit",hit2);	
			 * 
			 * (총 조회수)
			 * view +=hit2;
			 * System.out.println("총 조회수 : " +view + "건");
			 * System.out.println("조회수 평균 : "+view/list.size()+ "건");
			 * 	
			*/
			
			Map<String,String>board1 = new HashMap<String,String>();
			board1 = list.get(i);	// board index0 , index1 값을 가져옴
			board1.put("rdate", board1.get("rdate").replace("-", ""));	//rdate 값을 가져와서 replace로 치환
			board1.put("hit", (Integer.parseInt(board1.get("hit"))+100)+"");	//hit값을 가져와서 정수변환후 +100 ->문자열 변환
			int view1 = Integer.parseInt(board1.get("hit"));
			view +=view1;
			Iterator<String> keys = board.keySet().iterator();
			while(keys.hasNext()) {	//keys값을 찾음
				String key = keys.next();	//keys값을 가져옴
				String value = board1.get(key);
				System.out.println(key+" -> "+value);
			}
		}
		System.out.println("총 조회수 : "+view);
		System.out.println("조회수 평균 : "+view/2);
	}
}
