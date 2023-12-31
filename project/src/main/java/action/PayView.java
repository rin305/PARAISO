package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//요청명령어에 해당되는 명령어 처리클래스=액션클래스=컨트롤러클래스
public class PayView implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String mem_id="",rsv_num="",rsv_name="",room_num="",room_type="",pay_price="";
		   request.setCharacterEncoding("UTF-8");
		   mem_id=(String) request.getSession().getAttribute("idKey");
		   rsv_num=request.getParameter("rsv_num");
		   rsv_name=request.getParameter("rsv_name");
		   room_num=request.getParameter("room_num");
		   room_type=request.getParameter("room_type");
		   pay_price=request.getParameter("pay_price");
		   //실행결과->서버의 메모리에 저장->이동
		   request.setAttribute("mem_id", mem_id);
		   request.setAttribute("rsv_num", rsv_num);
		   request.setAttribute("rsv_name", rsv_name);
		   request.setAttribute("room_num", room_num);
		   request.setAttribute("room_type", room_type);
		   request.setAttribute("pay_price", pay_price);

	
		return "/payConfirm.jsp";//컨트롤러가 이동시키면서 공유시켜준다.
	}
}




