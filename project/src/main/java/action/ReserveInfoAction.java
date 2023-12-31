package action;


import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

import java.util.*;//List

//요청명령어에 해당되는 명령어 처리클래스=액션클래스=컨트롤러클래스
public class ReserveInfoAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("ReserveInfoAction 호출 됨!");
		//화면에 출력할 list.jsp에 전달될 페이지와 전달할 값을 설정하기 위해서
		response.setContentType("text/html; charset=utf-8");
		String idKey = (String) request.getSession().getAttribute("idKey");
		System.out.println("ReserveInfoAction idKey =>"+idKey);
		String startDate;
		String endDate;
		ReservationDAO dbPro = new ReservationDAO();
		startDate=request.getParameter("sdate");
		endDate=request.getParameter("edate");
		boolean loginCheck;
		
		if (startDate == null) {
		    // 현재 날짜
		    Date today = new Date();
		    // 3달 전 날짜
		    Calendar cal = Calendar.getInstance();
		    cal.setTime(today);
		    cal.add(Calendar.MONTH, -3);
		    Date before3Month = cal.getTime();
		    startDate = new SimpleDateFormat("yyyy-MM-dd").format(before3Month);
		}

		if (endDate == null) {
		    // 현재 날짜
		    Date today = new Date();
		    // 3달 후 날짜
		    Calendar cal = Calendar.getInstance();
		    cal.setTime(today);
		    cal.add(Calendar.MONTH, 3);
		    Date after3Month = cal.getTime();
		    endDate = new SimpleDateFormat("yyyy-MM-dd").format(after3Month);
		}
		List<ReservationDTO> resInfo=dbPro.getReserveInfo(idKey, startDate,endDate);

		System.out.println("person=>"+idKey+"  startDate=>"+startDate+"  endDate=>"+endDate);
		System.out.println("resInfo=>"+resInfo);

		//모델2 request.setAttribute(키명,저장할값)
		request.setAttribute("resInfo", resInfo);
		
		
		
			if (idKey == null) {
			return "/loginAlert.jsp";
		} else{
			loginCheck = true;
			request.setAttribute("loginCheck", loginCheck);
			return "/resInfo.jsp";
		}
	}
}




