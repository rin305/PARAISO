package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

//요청명령어에 해당되는 명령어 처리클래스=액션클래스=컨트롤러클래스
public class ReserveDetailAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	 ReservationDAO dbPro=new ReservationDAO();
		//화면에 출력할 list.jsp에 전달될 페이지와 전달할 값을 설정하기 위해서
		String rsv_num=request.getParameter("rsv_num");
		ReservationDTO resDetail=dbPro.getReserveDetail(rsv_num);
		
		System.out.println("resDetail=>"+resDetail);
	 
	  
	   //2.처리한 결과를 공유(서버메모리에 저장)->이동할 페이지에 공유해서 사용(request)
		request.setAttribute("resDetail", resDetail);//${search} 검색어
	
		
		//3.공유해서 이동할 수있도록 페이지를 지정
		return "/resDetail.jsp";//컨트롤러가 이동시키면서 공유시켜준다.
	}
}




