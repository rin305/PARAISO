package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ManagerDAO;
import model.MemberDTO;
import model.PayDTO;

public class PayListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		ManagerDAO managerdao=new ManagerDAO();
		ArrayList<PayDTO> list= managerdao.payList();
		System.out.println("list=>"+list);
		request.setAttribute("list", list);
		
		System.out.println("payListAction의 list=>"+list);
		return "/paylist.jsp";
	}
		
	

}
