package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberDTO;

public class MemberContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String mem_id=(String)request.getSession().getAttribute("idKey");
		MemberDAO memdao=new MemberDAO();
	 	MemberDTO memdto=memdao.getPerson(mem_id);
		request.setAttribute("memdto", memdto);
		
		
		return "/infoEdit.jsp";
	}

}
