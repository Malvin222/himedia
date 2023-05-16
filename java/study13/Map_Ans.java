package study13;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class Map_Ans {
	//풀어보기1
		public static void main(String[] args) {
			Map<String,Integer>map1 = new HashMap<String,Integer>();
			map1.put("영어", 100);
			map1.put("국어", 80);
			map1.put("수학", 90);
			int hap = 0;
			Iterator<String> keys = map1.keySet().iterator();
			//keys = {"영어","국어","수학"}
			while(keys.hasNext()) {
				String key1 = keys.next();	//key1 변수 생성 및 keys 값 가져옴
				int value = map1.get(key1);	//점수값 가져옴
				hap +=value;	//hap 변수에 누적
				//System.out.println(map1.get(key));
			}
			System.out.println("총점 : "+hap);
			System.out.println("평균 : "+hap/map1.size());
			System.out.println("-----");
		//풀어보기2 
			Map<String,Integer>map2 = new HashMap<String,Integer>();

			map2.put("영어", 50);
			map2.put("국어", 40);
			map2.put("수학", 70);
			hap=0;
			String str = "";	//낙제과목명 저장
			hap = map2.get("영어")+map2.get("국어")+map2.get("수학");
			//double avg2 = Math.round(((hap/(double)map2.size())*10)/10.0);
			double avg2 = (double)hap/(double)(map2.size());
			keys = map2.keySet().iterator();
			//keys =>{"pass","titel","name"}
			String key = "";
			while(keys.hasNext()) {		//hasNext()존재 유무를 따짐 ->(다음 출력할 내용)존재유무
				key = keys.next();	//keys 값을 얻어옴	->출력할 내용을 추출
				if(map2.get(key )<60) {
					str += key+",";	//연결 ;; str = "영어,국어,";
				}
			}
			int str_len = str.length();		//영어, 콤마 지움
			str = str.substring(0,str_len-1);	//
			
			String a1 =Double.toString(avg2);	//소수점 첫째자리
			a1 = a1.substring(0,4);				// 소수점 첫째자리
			
			String a2 =avg2+"";
			String[] a3 = a2.split("\\.");	//.은 \\가 있어야 인식
			//a3[0] = "53"; a3[1] = "33333333336"
			String a4 = a3[0]+"."+a3[1].substring(0,1);
			System.out.println("총점 : "+hap);
			System.out.println("평균 : "+a1);	//더블 -> 문자열 -> 서브스트링
			System.out.println("평균 : "+a4);	//더블 -> 문자열 ->스플릿 -> [0],[1];
			System.out.printf("평균 : %.1f",avg2);	//printf -> %.1f (소수점첫째재리)
			System.out.println();
			System.out.println("낙제과목 : "+str);
			System.out.println("-----");
		//풀어보기3
			Map<String,String>map3 = new HashMap<String,String>();
			map3.put("이름", "홍길동");
			map3.put("영어", "90");
			map3.put("국어", "10");
			map3.put("수학", "70");
			//수정
			map3.put("국어","80");
			
			int hap3 = 0;
			Iterator<String> keys3 =map3.keySet().iterator();
			
			while(keys3.hasNext()) {	//hasNext()존재 유무를 따짐 ->(다음 출력할 내용)존재유무
				String key3 =keys3.next(); //keys 값을 얻어옴	->출력할 내용을 추출
				String value3 = map3.get(key3);
				
				if(!key3.equals("이름")) {	//key3의 값이 이름이 아닐경우
					hap3+=Integer.parseInt(value3);	//연산
				}
			}
			
			//hap = Integer.parseInt(map3.get("영어"))+
				//	Integer.parseInt(map3.get("국어"))+
					//Integer.parseInt(map3.get("수학"));
			int avg3 = hap3/(map3.size()-1);	//keys:이름의 값은 점수가 아니므로 3이여야한다
			System.out.println("총점 : "+hap3);
			System.out.println("평균 : "+avg3);
			System.out.println("-----");
		//풀어보기4
			List<String> list4 = new ArrayList<String>();
			list4.add("50");	//문자열 -> 나중에 데이터베이스에서 데이터가 넘어올때 문자열로 넘어옴
			list4.add("60");
			list4.add("70");
			int hap4 = 0;
			for(int i = 0;i<list4.size();i++) {
				hap4 += Integer.parseInt(list4.get(i));
			}
			int avg4 = hap4/list4.size();
			System.out.println("총점 : "+hap4);
			System.out.println("평균 : "+avg4);
		}
}

