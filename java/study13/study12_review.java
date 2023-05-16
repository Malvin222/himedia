package study13;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
//다들 혹시 하시다가 이해안되거나 모르시는거 있으면 편하게 물어봐요!
//01020158027 23시 이전에만!
public class study12_review {
	public static void main(String[] args) {
		
		//배열
		//ArrayList ,HashMap				<String>:데이터값
		List<String> list1 = new ArrayList<String>();	//인스턴스 생성
		list1.add("100");	//index : 0
		list1.add("90");	//index : 1
		System.out.println(list1.get(0));
		
		List<Integer> list2 = new ArrayList<Integer>();
		list2.add(20);
		list2.add(80);
		System.out.println(list2.get(0));
		
		List<Double> list3 = new ArrayList<Double>();
		list3.add(20.3);
		list3.add(80.787);
		System.out.println(list3);	//index 전체 출력(타입,값)//list는 [] 대괄호로 출력
		System.out.println(list3.get(1));
		System.out.println(list3.size());	//요소갯수
		System.out.println("--------");
		
		String[] a1	= {"aa","bb","cc"};
		System.out.println(a1); //전체 타입,값 출력	//배열은 지원하지 않음
		System.out.println(a1[0]);		//자리번호로 데이터값을 가져옴
		System.out.println(a1.length);	//요소개수
		
		System.out.println("--------");
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("0", "aa");	//String(key), String(value) 타입으로 입력
		map1.put("1", "bb");
		map1.put("2", "cc");
		System.out.println(map1);	//index 전체 출력 //map은 {} 중괄호 형태로 출력
		System.out.println(map1.get("userid")); //key값으로 데이터값을 가져옴	//String 값으로 입력해주어야함
		System.out.println(map1.size());
		
		
		
		Map<String,String> map2 = new HashMap<String,String>();
		map2.put("userid", "test123");	//String(key), String(value) 타입으로 입력
		map2.put("pass", "123456");
		map2.put("birthday", "2020-12-25");
		System.out.println(map2);	//index 전체 출력 //map은 {} 중괄호 형태로 출력
		System.out.println(map2.get("userid")); //key값으로 데이터값을 가져옴	//String 값으로 입력해주어야함
		System.out.println(map2.size());
		
		//ArrayList (반복문)출력
		//인덱스번호를 이용한 출력
		System.out.println("---반복문---");
		for(int i=0;i<list1.size();i++) {
			System.out.println("list["+i+"] : "+list1.get(i));
		}
		System.out.println();
		//배열(반복문)출력
		//인덱스번호를 이용한 출력
		for(int i=0;i<a1.length;i++) {
			System.out.println("배열["+i+"] :"+a1[i]);
		}
		System.out.println();
		//Map(반복문)출력
		//key 값을 이용한 출력
		Iterator<String> keys = map2.keySet().iterator();
		//keys ={"userid","pass","birthday"};
		while(keys.hasNext()){		//hasNext() (다음 출력내용)값의 존재 유무
			//keys.next();//키값을 가져옴
			String key = keys.next();
			System.out.println(key+" : "+map2.get(key));
			
		}
		
	}
	
}
