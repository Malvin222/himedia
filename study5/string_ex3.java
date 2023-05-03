package study5;

public class string_ex3 {

	public static void main(String[] args) {
		String jumsu = "eng:70,kor:90,math:88";
		String[] j1 = jumsu.split(",");
		for(int i=0;i<j1.length;i++) {
		System.out.println(j1[i]);
		}
		
		//String[] j2 = j1.split(":");
		
		//[풀어보기 4]
		for(int i=0;i<j1.length;i++) {
				//math : 88 -> {"math", "88"};
			System.out.print(j1[i].split(":")[1] + " ");	
		}
		System.out.println("");
		System.out.println("----------");
		//[풀어보기 5] 
		String birthday = "1990/05/27";
		//90년 5월 27일 생 
		//String [] b1 = {"1990","05","27"}
		String[] bb = birthday.split("/");
		String yy = bb[0].substring(2);
		//String mm = bb[1].substring(1,2);
		String mm = bb[1].charAt(1)+ "";
		String dd = bb[2];
		
		System.out.println(yy+"년 "+mm+"월 "+dd+"일 생");
	
		System.out.println("----------");
		String str = "java";
		System.out.println(str.substring(0,1)); // 0~0
		System.out.println(" "+str.substring(1,2)); // 1~1
		System.out.println("  "+str.substring(2,3)); // 2~2
		System.out.println("   "+str.substring(3,4)); // 3~3
		
		System.out.println("----------");
		for(int i=0;i<str.length();i++) {
			for(int j=0;j<i;j++) {	
					System.out.print(" ");
				}		
				System.out.println(str.substring(i,i+1));
			}
			
	}
}
