package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyPageAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
			response.setContentType("text/html; charset=utf-8");
			String mem_id = (String) request.getSession().getAttribute("idKey");

			if (mem_id==null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인 후 이용해주세요.');");
				script.println("</script>");
				script.close();
				return "/login.jsp";
			}else {
				return "/mypage.jsp";
			}
	}

}
