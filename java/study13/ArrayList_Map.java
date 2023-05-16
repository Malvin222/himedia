package study13;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
//다들 혹시 하시다가 이해안되거나 모르시는거 있으면 편하게 물어봐요!
//01020158027 23시 이전에만!
public class ArrayList_Map {
	public static void main(String[] args) {
		List<Map> list1 = new ArrayList<Map>();
		Map<String,String>map1 = new HashMap<String,String>();
		map1.put("id", "test1");
		map1.put("eng", "90");
		map1.put("kor", "80");
		map1.put("math", "84");
		list1.add(map1);	//index : 0
		
		Iterator<String> keys1 =map1.keySet().iterator();
		
		map1 =new HashMap<String,String>();	//없으면 기존 객체에 덮어씌워짐 새로운 데이터 영역 생성
		map1.put("id", "test2");
		map1.put("eng", "80");
		map1.put("kor", "82");
		map1.put("math", "90");
		list1.add(map1);	//index : 1
		
		System.out.println("list 전체: "+list1);	//list.get(0): test1 //list.get(1):test2
		System.out.println("list 행 길이: "+list1.size());
		System.out.println("list 1행: "+list1.get(0));
		System.out.println("list 2행: "+list1.get(1));
		System.out.println("list 1행 길이: "+list1.get(0).size());
		System.out.println("list 2행 길이: "+list1.get(1).size());
		System.out.println("-----------");
		//풀어보기 1 
		System.out.println("------풀어보기1-----");
		for (int i=0;i<list1.size();i++) {		//두번 반복 해당 맵(index : 0 , 1)을 지정
			Map<String,String>map = new HashMap<String,String>();
			map = list1.get(i);	//각 맵(index:0,index:1 추출)	//map 정의
			System.out.println((i+1)+"행 : "+map);
			//풀어보기 2
			Iterator<String> keys2 =map1.keySet().iterator();
			while(keys2.hasNext()) {	//hasNext()존재 유무를 따짐 ->(다음 출력할 내용)존재유무
				String key2	=keys2.next(); //keys 값을 얻어옴	->출력할 내용을 추출
				String value2 = map.get(key2);			
				System.out.println(key2+":"+value2);	//내부적인 순서는 정하지 못함
			
		}
			}
		}
	}

