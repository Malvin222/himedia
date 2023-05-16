package study12_1;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class Map_Q1 {
	//풀어보기1
	public static void main(String[] args) {
		Map<String,Integer>map1 = new HashMap<String,Integer>();
		map1.put("영어", 100);
		map1.put("국어", 80);
		map1.put("수학", 90);
		int hap = map1.get("영어")+map1.get("국어")+map1.get("수학");
		int avg = hap/map1.size();
		System.out.println("총점 : "+hap);
		System.out.println("평균 : "+avg);
		System.out.println("-----");
	
	//풀어보기2 
		Map<String,Integer>map2 = new HashMap<String,Integer>();

		map2.put("영어", 50);
		map2.put("국어", 40);
		map2.put("수학", 70);
		hap = map2.get("영어")+map2.get("국어")+map2.get("수학");
		double avg3 = hap/(double)map2.size();
		Iterator<String>keys = map1.keySet().iterator();
		//keys =>{"pass","titel","name"}
		String key = "";
		System.out.println("총점 : "+hap);
		System.out.printf("평균 : %.1f",avg3);
		System.out.println();
		System.out.print("낙제과목 : ");
		while(keys.hasNext()) {		//hasNext()존재 유무를 따짐 ->(다음 출력할 내용)존재유무
			key = keys.next();	//keys 값을 얻어옴	->출력할 내용을 추출
		if(map2.get(key)<=60) {
		System.out.print(key);
		}
		}
		System.out.println();
		
		System.out.println("-----");
	//풀어보기3
		Map<String,String>map3 = new HashMap<String,String>();
		map3.put("이름", "홍길동");
		map3.put("영어", "90");
		map3.put("국어", "10");
		map3.put("수학", "70");
		//수정
		map3.put("국어","80");
		hap = Integer.parseInt(map3.get("영어"))+
				Integer.parseInt(map3.get("국어"))+
				Integer.parseInt(map3.get("수학"));
		avg = hap/3;
		System.out.println("총점 : "+hap);
		System.out.println("평균 : "+avg);
		System.out.println("-----");
	//풀어보기4
		List<String> list1 = new ArrayList<String>();
		list1.add("50");
		list1.add("60");
		list1.add("70");
		hap = Integer.parseInt(list1.get(0))+
				Integer.parseInt(list1.get(1))+
				Integer.parseInt(list1.get(2));
		avg = hap/list1.size();
		System.out.println("총점 : "+hap);
		System.out.println("평균 : "+avg);
	}
}
