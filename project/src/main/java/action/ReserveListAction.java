package action;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

import java.util.*;//List

//요청명령어에 해당되는 명령어 처리클래스=액션클래스=컨트롤러클래스
public class ReserveListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 1./list.jsp에서 처리했던 자바코드를 ->결과를 request에 담고 이동->jsp
		
		String mem_id = (String) request.getSession().getAttribute("idKey");
		String person=request.getParameter("person");
		System.out.println("reserveList의 person=> "+person);
		if(person == null) {
			person = "1";
		}
		String startDate,endDate;
		startDate=request.getParameter("sdate");
		if (startDate == null) {
			startDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		}
		endDate=request.getParameter("edate");
		if (endDate == null) {
			Date tommorow=new Date();
			tommorow.setDate(tommorow.getDate()+1);
			endDate=new SimpleDateFormat("yyyy-MM-dd").format(tommorow);
		}
		
	 
	 ReservationDAO dbPro=new ReservationDAO();
	 
	 List<ReservationDTO> list=dbPro.getAvailableRooms(person, startDate, endDate);
	 
	  
	   //2.처리한 결과를 공유(서버메모리에 저장)->이동할 페이지에 공유해서 사용(request)
		request.setAttribute("list", list);//${search} 검색어
	
		
		//3.공유해서 이동할 수있도록 페이지를 지정
		return "/roomList.jsp";//컨트롤러가 이동시키면서 공유시켜준다.
	}
}




