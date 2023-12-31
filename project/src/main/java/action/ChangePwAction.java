package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberDTO;

public class ChangePwAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		if((String) request.getSession().getAttribute("idKey")==null) {
			return "/changePw.jsp?error";
		}
		try {
			request.setCharacterEncoding("UTF-8");

			String mem_id = (String) request.getSession().getAttribute("idKey");
			String mem_pw = request.getParameter("newPw");
			System.out.println("ChangePwAction의 mem_id 값=>" + mem_id);

			MemberDTO memDto = new MemberDTO();
			MemberDAO memDao = new MemberDAO();
			boolean check = memDao.ChangePw(mem_id, mem_pw);
			System.out.println("ChangePwAction의 check 값=>" + check);

			request.getSession().setAttribute("idKey", null);

			return "/login.jsp";
			
		} catch (Exception e) {
			e.printStackTrace();
			return "/login.jsp?error";
		}
	}

}
