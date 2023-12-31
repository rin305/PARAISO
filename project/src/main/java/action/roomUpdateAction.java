package action;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDTO;
import model.RoomDAO;
import model.RoomDTO;

// /writePro.do
public class roomUpdateAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		 // request.setCharacterEncoding("utf-8");
		
		//int room_num=Integer.parseInt(request.getParameter("room_num"));
        String room_type=request.getParameter("room_type");
        System.out.println("room_type"+room_type);
			
            RoomDAO roomdao=new RoomDAO();
            //이싀버르일의르이르 여기서 틀리이잉미ㅓㅇㄹ미ㅓㅇ리
			RoomDTO roomdto=roomdao.selectList(room_type);
			System.out.println("roomdto=>"+roomdto);
			
			
		 
	     request.setAttribute("room_type", room_type);
		 request.setAttribute("roomdto", roomdto);
//		 request.setAttribute("peakseason", peakseason);
//		 request.setAttribute("offseason", offseason);
		 
		return "/roomUpdate.jsp";
	}
}
