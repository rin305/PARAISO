package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;


//요청명령어에 해당되는 명령어 처리클래스=액션클래스=컨트롤러클래스
public class PaymentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		ReservationDAO dbPro = new ReservationDAO();
		
		String rsv_num=request.getParameter("rsv_num");	
		String pay_price=request.getParameter("pay_price");	
		String room_num=request.getParameter("room_num");
		String mem_id=(String) request.getSession().getAttribute("idKey");
		
		System.out.println("rsv_num , pay_price, room_num, mem_id : "+ rsv_num+pay_price+room_num+mem_id);
		
		System.out.println(rsv_num);
		System.out.println(pay_price);
		System.out.println(mem_id);
		boolean result = dbPro.reservePayment(rsv_num, mem_id, pay_price, room_num);
		
		request.setAttribute("result", result);

		return "/pay.jsp";//컨트롤러가 이동시키면서 공유시켜준다.
	}
}




