/**
   회원의 데이터가 유효한지 체크해주는 자바스크립트 파일
 * 작성날짜:2023.03.05
    작성자:조예린
 */

 //1. 아이디 체크
 function idCheck(id){
		var regex = /^[a-z][a-z0-9]{7,19}$/; //아이디의 형식 지정
    	var mem_id = $("mem_id").value; //register.jsp에서 받아온 id값 담기
    	var judge = regex.test(mem_id); //아이디 형식 테스트
		if(id==""){ //아이디가 null이라면
		$("idmsg").innerHTML="<font color='red'>아이디를 입력해주세요.</font>"; //아이디 입력 메시지 출력
		$("mem_id").focus(); //아이디 칸에 커서 두기
		return false;
		}else if(id!=null && !judge){ //아이디를 입력했으나 형식에 맞지 않는 경우
    		$("idmsg").innerHTML="<font color='red'>아이디는 영소문자,숫자 포함 8자 이상이어야 합니다.</font>";
    		return false;
    	}
}
//2.이름 체크
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
			$("namemsg").innerHTML="<font color='green'>멋진 이름이군요!</font>";
    		return false;
		}
}
//3.이메일 체크
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

  