package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberDTO;

public class IndexAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		try {
			String mem_id=(String)request.getSession().getAttribute("idKey");
			MemberDAO memdao=new MemberDAO();
			MemberDTO memdto=memdao.getPerson(mem_id);
			String membership="비회원";
			boolean admincheck=false;
			if(mem_id!=null) {
				membership=memdto.getMem_grade();
				if(memdto.getMem_grade().equals("관리자")) {
					admincheck=true;
				}
			}
			request.getSession().setAttribute("admincheck",admincheck);
			request.getSession().setAttribute("membership",memdto.getMem_grade());
	/*		if(mem_id == null) {
				request.getSession().setAttribute("membership","비회원");
				return "/index.jsp";
			}else {
				if(memdto.getMem_grade().equals("관리자")) {
					boolean admincheck=true;
					request.getSession().setAttribute("admincheck",admincheck);
					return "/index.jsp";
				}else {
					boolean admincheck=false;
					request.getSession().setAttribute("admincheck",admincheck);
				request.getSession().setAttribute("membership",memdto.getMem_grade());
				return "/index.jsp";
				}
			}*/
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/index.jsp";
	}

}
