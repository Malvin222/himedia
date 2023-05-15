package study12_1;

import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

public class Vector_Linked {
	public static void main(String[] args) {
		List<String> vector = new Vector<String>();
		vector.add("103");
		vector.add("105");
		vector.add("101");
		System.out.println(vector);
		System.out.println(vector.get(0));
		System.out.println(vector.get(1));
		System.out.println(vector.get(2));
		
		List<String> list2 = new LinkedList<String>();
		list2.add("103");
		list2.add("105");
		list2.add("101");
		System.out.println(list2);
		System.out.println(list2.get(0));
		System.out.println(list2.get(1));
		System.out.println(list2.get(2));
	}
}
