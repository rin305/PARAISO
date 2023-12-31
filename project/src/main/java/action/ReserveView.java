package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//요청명령어에 해당되는 명령어 처리클래스=액션클래스=컨트롤러클래스
public class ReserveView implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String rsv_price="",rsv_start="",rsv_end="",rsv_person="";
		
		
		   String mem_id = (String) request.getSession().getAttribute("idKey");
		   rsv_price=request.getParameter("rsv_price");
		   rsv_start=request.getParameter("rsv_start");
		   rsv_end=request.getParameter("rsv_end");
		   rsv_person=request.getParameter("rsv_person");
		   
		   //실행결과->서버의 메모리에 저장->이동
		   request.setAttribute("rsv_price", rsv_price);
		   request.setAttribute("rsv_start", rsv_start);
		   request.setAttribute("rsv_end", rsv_end);
		   request.setAttribute("rsv_person", rsv_person);

	
		return "/res.jsp";//컨트롤러가 이동시키면서 공유시켜준다.
	}
}




