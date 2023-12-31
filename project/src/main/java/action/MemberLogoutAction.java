package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberLogoutAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		
		String mem_id=(String)request.getSession().getAttribute("idKey");
		System.out.println("MemberLogoutAction의 mem_id 값=>"+mem_id);
		
		request.getSession().setAttribute("idKey", null);
		request.getSession().setAttribute("admincheck", false);
		request.getSession().setAttribute("membership", "비회원");
		
		return "/index.jsp";
	}
	
}

