package study12_1;

import java.util.ArrayList;
import java.util.List;

public class ArrayListTest1 {
	public static void main(String[] args) {
		//String[] st = {"50","60","70"};
		List<String> list1 = new ArrayList<String>();
		list1.add("50");	//list1 (0)에 저장
		list1.add("60");
		list1.add("70");
		
		System.out.println(list1.get(0));	//list1(0)을 불러옴
		System.out.println(list1.get(1));
		System.out.println(list1.get(2));
		System.out.println("list1 저장된 객체 수 : "+list1.size());	//list 저장 객체수를 불러옴
		list1.remove(0);	//list1 0 에 저장된 값을 지움
		System.out.println(list1.get(0));	//list1(0)을 불러옴
		System.out.println(list1.get(1));
		//System.out.println(list1.get(2));	//remove로 지워져서 (2)에 값으 없어서 에러;
		System.out.println("list1 저장된 객체 수 : "+list1.size());	//list 저장 객체수를 불러옴
		
		List<String> list2 = new ArrayList<String>();
		list2.add("80");
		list2.add("90");
		System.out.println(list2.get(0));
		System.out.println(list2.get(1));
		
		List<String>list3 = new ArrayList<String>();
		list3.add(0,"10");	//초기 시작은 무조건 0
		list3.add(1,"20");
		//list3.add(3,"30");	//2번 자리가 비어서 에러남	순서대로 채워야함
		System.out.println(list3.get(0));
		System.out.println(list3.get(1));
		//System.out.println(list3.get(3));	//3번값이 존재하지 않음
		for (int i=0; i<list3.size();i++) {
			System.out.println(i+":"+list3.get(i));	//인덱스 번호
		}
	}
}
