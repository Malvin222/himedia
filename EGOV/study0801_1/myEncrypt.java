package egov.mywork1.web;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class myEncrypt {

		public static String testMD5(String pwd) {
		    String MD5 = "";
		    try {
		        MessageDigest md = MessageDigest.getInstance("MD5");
		        md.update(pwd.getBytes());
		        byte byteData[] = md.digest();
		        StringBuffer sb = new StringBuffer();
		        for (int i = 0; i < byteData.length; i++) {
		            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		        }
		        MD5 = sb.toString();
		 
		    } catch (NoSuchAlgorithmException e) {
		        e.printStackTrace();
		        MD5 = null;
		    }
		    return MD5;
		}
}
