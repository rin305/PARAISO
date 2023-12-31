package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

public class MemberDeleteAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
			String mem_id = (String) request.getSession().getAttribute("idKey");
			String mem_pw = request.getParameter("userPw");
			System.out.println("MemberDeleteAction의 id=>" + mem_id + ", mem_pw=>" + mem_pw);
			
			MemberDAO memdao = new MemberDAO();
			boolean check = memdao.memberDelete(mem_id, mem_pw);
			System.out.println("MemberDeleteAction의 check=>"+check);
			if (check) {
				request.getSession().setAttribute("idKey", null);
				return "/index.jsp";
			} else {
				request.getSession().setAttribute("idKey", mem_id);
				return "/memberDelete.jsp?error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "/memberDelete.jsp?error";
		}
	}

}
