package action;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

import java.util.*;//List

//요청명령어에 해당되는 명령어 처리클래스=액션클래스=컨트롤러클래스
public class ReserveRoomAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String mem_id = (String) request.getSession().getAttribute("idKey");
		String rsv_name=request.getParameter("rsv_name");
		String room_num=request.getParameter("room_num");
		String rsv_start=request.getParameter("rsv_start");
		String rsv_end=request.getParameter("rsv_end");
		String rsv_price=request.getParameter("rsv_price");
		String rsv_person=request.getParameter("rsv_person");
		String rsv_phone=request.getParameter("rsv_phone");
		
		ReservationDAO dbPro=new ReservationDAO();
				
		dbPro.rsvRoom(mem_id, rsv_name, room_num, rsv_start, rsv_end, rsv_price, rsv_person, rsv_phone);
				
	
		
		return "/index.jsp";//메인으로 다시 이동
	}
}




