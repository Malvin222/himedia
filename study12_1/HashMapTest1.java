package study12_1;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class HashMapTest1 {
	public static void main(String[] args) {
		Map<String,String>map1 = new HashMap<String,String>();
		map1.put("title", "첫글입니다");	//put(key,value); ,put(column,value)
		map1.put("pass", "1234");
		map1.put("name","홍길동");
		System.out.println(map1);
		System.out.println(map1.get("title"));
		System.out.println(map1.get("pass"));
		System.out.println(map1.get("name"));
		
		Map<String,Integer>map2 = new HashMap<String,Integer>();
		map2.put("a", 11);
		map2.put("b",22);
		map2.put("c", 33);
		System.out.println(map2);
		System.out.println(map2.get("a"));
		System.out.println(map2.get("b"));
		System.out.println(map2.get("c"));
		
		Map<Integer,String> map3 = new HashMap<Integer,String>();
		map3.put(5, "11");
		map3.put(11, "22");
		map3.put(17, "33");
		System.out.println(map3);
		System.out.println(map3.get(5));
		System.out.println(map3.get(11));
		System.out.println(map3.get(17));
		System.out.println("--------");
		
		String key = "";
		String value = "";
		/*Iteractor :반복적인 내용의 값을 담을 때 사용
		 *key 정보 반환 (포인터가 데이터 보다 위) 
		 */
		Iterator<String>keys = map1.keySet().iterator();
		//keys =>{"pass","titel","name"}
		while(keys.hasNext()) {		//hasNext()존재 유무를 따짐 ->(다음 출력할 내용)존재유무
			key = keys.next();	//keys 값을 얻어옴	->출력할 내용을 추출
			value = map1.get(key);
			System.out.println(key + ":"+value);
		}
	}
}
