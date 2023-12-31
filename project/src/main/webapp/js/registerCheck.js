/**
   회원의 데이터가 유효한지 체크해주는 자바스크립트 파일
 * 작성날짜:2023.02.20
    작성자:조예린
 */
 
 var xhrObject; //xhr객체를 전역변수로 선언
 
 //1.xhr객체를  생성해주는 함수
 function createXHR(){
	
	   if(window.XMLHttpRequest){
		//var를 생략한 이유->중복선언때문에
		//중복선언을 허용=>에러잡기가 어렵다(두번 변수를 선언하는 것)
		   xhrObject=new XMLHttpRequest();//객체생성
		   //alert(xhrObject);//[xhrObject]
	   }
   }
 
 //2.중복id를 입력
 function idCheck(id){
		var regex = /^[a-z][a-z0-9]{7,19}$/; //아이디의 형식 지정
    	var mem_id = $("mem_id").value; //register.jsp에서 받아온 id값 담기
    	var judge = regex.test(mem_id); //아이디 형식 테스트
		if(id==""){ //아이디가 null이라면
		$("idmsg").innerHTML="<font color='red'>아이디는 필수정보입니다.</font>"; //아이디 입력 메시지 출력
		$("mem_id").focus(); //아이디 칸에 커서 두기
		return false;
		}else if(id!=null && !judge){ //아이디를 입력했으나 형식에 맞지 않는 경우
    		$("idmsg").innerHTML="<font color='red'>아이디는 영소문자,숫자 포함 8자 이상이어야 합니다.</font>";
    		return false;
    	}
	//형식에 맞는 경우 중복 id여부 체크
	//1.xhr객체 얻어오기
	createXHR()
	var url="http://localhost:8090/ParaisoResort/IdCheck.jsp?"+getParameterValues()
	//2.콜백함수지정->서버의 결과를 받아서 처리
	xhrObject.onreadystatechange=resultProcess;
	//3.open함수를 이용해서 서버에 요청준비
	xhrObject.open("Get",url,true);
	//4.서버에 요청
	xhrObject.send(null);
}

//3.파라미터값을 처리해주는 함수=>서버의 메모리 캐시를 제거시키는 역할
function getParameterValues(){
	var mem_id=$("mem_id").value;
	//document.regForm.mem_id.value
	//서버캐시에 요청메모리에 저장시키지않는 방법
	//->항상 동일한요청을 하지않기위해서->시간은 항상 같지가 않기때문에
	
	return "mem_id="+mem_id+"&timestamp="+new Date().getTime()
}

//4.콜백함수
function resultProcess(){
	//alert("resultProcess")
	if(xhrObject.readyState==4){//서버가 요청을 다받았다면
		if(xhrObject.status==200){//서버로부터 정상적으로 결과를 받았다면
			var result=xhrObject.responseText;//태그+문자열
			$("idmsg").innerHTML=result;
		}
	}
}

//6.이름 체크
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
 //5.비밀번호 체크
function pwCheck(pw){
            var regex = /^[a-zA-Z][a-zA-z0-9]{7,15}$/;
            var mem_pw =$("mem_pw").value;
			var judge = regex.test(mem_pw);
            if(pw==""){ //아이디가 null이라면
		$("pwmsg").innerHTML="<font color='red'>필수정보입니다.</font>"; //아이디 입력 메시지 출력
		//$("mem_pw").focus(); //비밀번호 칸에 커서 두기
		return false;
		}else if(pw!=null && !judge){ //아이디를 입력했으나 형식에 맞지 않는 경우
    		$("pwmsg").innerHTML="<font color='red'>8~16자 영문(대/소), 숫자를 사용하세요.</font>";
    		return false;
		}else{
			$("pwmsg").innerHTML="";
		}
}  
//비밀번호 재확인
function pwReCheck(pw2){
            var mem_pw =$("mem_pw").value;
            var mem_pw2 =$("mem_pw2").value;
            if(pw2=="" || mem_pw2!=mem_pw){ //아이디가 null이라면
		$("pwmsg2").innerHTML="<font color='red'>비밀번호가 일치하지않습니다.</font>"; //아이디 입력 메시지 출력
		//$("mem_phone").focus(); //아이디 칸에 커서 두기
		return false;
		}else{
			$("pwmsg2").innerHTML="<font color='green'>비밀번호가 일치합니다.</font>";
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

  