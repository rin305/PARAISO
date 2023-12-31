package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RoomDAO;
import model.RoomDTO;

// /writePro.do
public class roomListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		  // request.setCharacterEncoding("utf-8");
		     //룸타입을 받아
		   
		RoomDAO roomdao=new RoomDAO();
		
		ArrayList<RoomDTO> list=roomdao.roomList();
		System.out.println("list=>"+list);
		request.setAttribute("list", list);
		
		
		    
		return "/roomList2.jsp";
	}
}
