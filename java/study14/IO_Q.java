package study14;

import java.io.File;
import java.io.FileWriter;
import java.util.Scanner;
import java.util.jar.Attributes.Name;

public class IO_Q {
	//문제1 
	public static void main(String[] args) {
		//문제1 (문제를 이해못함 ㅈㅅ;;;)
			/*String txt = "Test101";
			String fileName = "C:\\html_test\\FileWriterTest\\tet101.txt";
			try {				
				File file = new File(fileName);
				FileWriter fw =new FileWriter(file,true);
				fw.write(txt);
				System.out.println("생성완료");		
			}catch(Exception e) {
				*/
			
		//문제2
			
			String path ="C:\\html_test\\FileWriterTest";
			try {
				File dir = new File(path);
				File[] names = dir.listFiles();
				for(int i=0;i<names.length;i++) {
					if(names[i].getName().contains(".java")) 	{
						System.out.println(names[i].getName());				
					}
				}
			}catch (Exception e ) {
				
			}
		}
}

