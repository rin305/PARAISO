package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberDTO;

public class MemberListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
MemberDAO memberdao=new MemberDAO();
		
		ArrayList<MemberDTO> list= memberdao.memberList();
		System.out.println("list=>"+list);
		request.setAttribute("list", list);
		
		System.out.println("memberlistaction의 list=>"+list);
		return "/memberlist.jsp";
	}

}
