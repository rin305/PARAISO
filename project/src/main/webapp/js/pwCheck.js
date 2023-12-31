/**
   회원의 데이터가 유효한지 체크해주는 자바스크립트 파일
 * 작성날짜:2023.03.18
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
 
 //2.현재 비밀번호를 입력
 function curPwCheck(pw){
    	var currentPw = $("currentPw").value;
		if(pw==""){ //아이디가 null이라면
		$("curpwmsg").innerHTML="<font color='red'>&nbsp;&nbsp;&nbsp;현재 비밀번호를 입력해주세요.</font>"; //아이디 입력 메시지 출력
		$("currentPw").focus(); //아이디 칸에 커서 두기
		return false;
		}
	//형식에 맞는 경우 중복 id여부 체크
	//1.xhr객체 얻어오기
	createXHR()
	var url="http://localhost:8090/ParaisoResort/pwCheck.jsp?"+getParameterValues()
	//2.콜백함수지정->서버의 결과를 받아서 처리
	xhrObject.onreadystatechange=resultProcess;
	//3.open함수를 이용해서 서버에 요청준비
	xhrObject.open("Get",url,true);
	//4.서버에 요청
	xhrObject.send(null);
}

//3.파라미터값을 처리해주는 함수=>서버의 메모리 캐시를 제거시키는 역할
function getParameterValues(){
	var currentPw=$("currentPw").value;
	//document.regForm.mem_id.value
	//서버캐시에 요청메모리에 저장시키지않는 방법
	//->항상 동일한요청을 하지않기위해서->시간은 항상 같지가 않기때문에
	
	return "currentPw="+currentPw+"&timestamp="+new Date().getTime()
}

//4.콜백함수
function resultProcess(){
	//alert("resultProcess")
	if(xhrObject.readyState==4){//서버가 요청을 다받았다면
		if(xhrObject.status==200){//서버로부터 정상적으로 결과를 받았다면
			var result=xhrObject.responseText;//태그+문자열
			$("curpwmsg").innerHTML=result;
		}
	}
}
 //5.비밀번호 체크
function newPwCheck(pw){
            var regex = /^[a-zA-Z][a-zA-z0-9]{7,15}$/;
            var newPw =$("newPw").value;
			var judge = regex.test(newPw);
            if(pw==""){ //비밀번호가 null이라면
		$("newpwmsg").innerHTML="<font color='red'>&nbsp;&nbsp;&nbsp;새 비밀번호를 입력해주세요.</font>"; //아이디 입력 메시지 출력
		//$("mem_pw").focus(); //비밀번호 칸에 커서 두기
		return false;
		}else if(pw!=null && !judge){
    		$("newpwmsg").innerHTML="<font color='red'>&nbsp;&nbsp;&nbsp;8~16자 영문(대/소), 숫자를 사용하세요.</font>";
    		return false;
		}else{
			$("newpwmsg").innerHTML="";
		}
} 



//비밀번호 재확인
function newPwReCheck(pw2){
            var newPw =$("newPw").value;
            var newPw2 =$("newPw2").value;
            if(pw2=="" ||newPw2!=newPw){ //아이디가 null이라면
		$("newpwcheckmsg").innerHTML="<font color='red'>&nbsp;&nbsp;&nbsp;동일한 비밀번호를 입력해주세요.</font>"; //아이디 입력 메시지 출력
		//$("mem_phone").focus(); //아이디 칸에 커서 두기
		return false;
		}else{
			$("newpwcheckmsg").innerHTML="<font color='green'>&nbsp;&nbsp;&nbsp;비밀번호가 일치합니다.</font>";
    		return false;
		}
} 
  