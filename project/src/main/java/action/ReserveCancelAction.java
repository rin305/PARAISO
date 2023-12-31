package action;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

import java.util.*;//List

//요청명령어에 해당되는 명령어 처리클래스=액션클래스=컨트롤러클래스
public class ReserveCancelAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String mem_id = (String) request.getSession().getAttribute("idKey");
		String rsv_num=request.getParameter("rsv_num");

		
		ReservationDAO dbPro=new ReservationDAO();
				
		boolean result = dbPro.reservationCancel(rsv_num);
				
	
		if (result) {
			return "/reserveCancelSuccess.jsp";
		} else {
			return "/reserveCancelFail.jsp";
		}
		
	}
}




