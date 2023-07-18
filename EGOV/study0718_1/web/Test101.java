package egov.mywork1.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test101 {

   public static void main(String[] args) {
         //list타입            //공간생성
      List<String> list1 = new ArrayList<String>(); 
      
      //add메소드로 데이터 넣기(데이터는 String타입)
      list1.add("abc1");
      list1.add("abc2");
      list1.add("abc3");
      
      //반복문을 통한 출력 (출력 : get(자리번호) )
      for(int i=0; i<list1.size(); i++) {
         System.out.println(list1.get(i));   
      }
      
      //HashMap을 통한 세팅 (map은 자리번호 x 컬럼명 o)
      //list와 다르게 컬럼명을 지정할 수 있음
      //Map<String,String> map1 = new HashMap<String,String>();
      //map1.put("title", "aaaa");
      //map1.put("pass", "1212");
      //map1.put("hits", "10");
      //System.out.println( map1.get("hits") );
      
      List<Map> list2 = new ArrayList<Map>();
      Map<String,String> map1 = new HashMap<String,String>();
      map1.put("title", "aaaa");
      map1.put("pass", "1212");
      map1.put("hits", "10");
   
   }

}