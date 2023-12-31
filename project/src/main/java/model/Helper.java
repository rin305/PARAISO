package model;

import java.security.SecureRandom;
import java.util.Date;

public class Helper {
	
	//1.랜덤 비밀번호를 구해주는 메서드
	 public String getRandomPassword() {
	        char[] charSet = new char[] {
	                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
	                 '!'};

	        StringBuffer sb = new StringBuffer();
	        SecureRandom sr = new SecureRandom();
	        sr.setSeed(new Date().getTime());

	        int idx = 0;
	        int len = charSet.length;
	        for (int i=0; i<6; i++) {
	            // idx = (int) (len * Math.random());
	            idx = sr.nextInt(len);    // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
	            sb.append(charSet[idx]);
	        }
	        return sb.toString();
	 }

	//2.아이디의 앞 세글자만 나타내주는 메서드
	 public String getProtectedId(String id) {
		 String initid=id.substring(0,3);
		 String proid=initid+"*****";
		 return proid;
	 }
	 
	//3.이름의 앞글자와 끝글자만 나타내주는 메서드
		 public String getProtectedName(String name) {
			 String initname=name.substring(0,1);
			 String proname=initname+"**";
			 return proname;
		 }
	 
}
