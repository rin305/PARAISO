/**
   회원의 데이터가 유효한지 체크해주는 자바스크립트 파일
 * 작성날짜:2023.03.23
    작성자:조예린
 */

//1.이름 체크
function nameCheck(name){
    		//this==이름 입력창
            var regex = /^[가-힣]{2,7}$/;
            var mem_name =$("mem_name").value;
			var judge = regex.test(mem_name);
            if(name==""){ //아이디가 null이라면
		$("namemsg").innerHTML="<font color='red'>필수정보입니다.</font>"; //아이디 입력 메시지 출력
		return false;
		}else if(name!=null && !judge){ //아이디를 입력했으나 형식에 맞지 않는 경우
    		$("namemsg").innerHTML="<font color='red'>2~7자의 한글만 사용 가능합니다.</font>";
    		return false;
		}else{
			$("namemsg").innerHTML="<font color='green'></font>";
    		return false;
		}
}
//7. 핸드폰 번호 체크
function phoneCheck(phone){
    		//this==이름 입력창
            var regex =  /^[0][1][0][0-9]{8}$/;
            var mem_phone =$("mem_phone").value;
			var judge = regex.test(mem_phone);
            if(phone==""){ //연락처가 null이라면
		$("phonemsg").innerHTML="<font color='red'>필수정보입니다.</font>"; //연락처 입력 메시지 출력
		return false;
		}else if(phone!=null && !judge){ //연락처를 입력했으나 형식에 맞지 않는 경우
    		$("phonemsg").innerHTML="<font color='red'>11자의 숫자를 입력해주세요.</font>";
    		return false;
		}else{//올바른 값 입력
			$("phonemsg").innerHTML="";
    		return false;
		}
}
//이메일 체크
function emailCheck(email){
	var regex = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
	var mem_email=$("mem_email").value;
	var judge = regex.test(mem_email);
	if(email==""){//이메일이 null이라면
		$("emailmsg").innerHTML="<font color='red'>필수정보입니다.</font>";
			return false;
		}else if(email!=null && !judge){ //아이디를 입력했으나 형식에 맞지 않는 경우
    		$("emailmsg").innerHTML="<font color='red'>이메일주소를 다시 확인하세요.</font>";
    		return false;
		}else{
			$("emailmsg").innerHTML="";
	}
}
//우편번호 체크
function addrCheck(addr){
	if(addr==""){//이메일이 null이라면
		$("addrmsg").innerHTML="<font color='red'>필수정보입니다.</font>";
			return false;
		}else{
			$("addrmsg").innerHTML="";
	}
}

  