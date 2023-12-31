package action;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDTO;
import model.RoomDAO;
import model.RoomDTO;

// /writePro.do
public class roomInsertAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		 
        int room_num=(Integer.parseInt(request.getParameter("room_num")));
        String room_type=request.getParameter("room_type");
        String room_grade=request.getParameter("room_grade");
        int room_price=(Integer.parseInt(request.getParameter("room_price")));
        String room_person=request.getParameter("room_person");
        int peakseason=(Integer.parseInt(request.getParameter("peakseason")));
        int offseason=(Integer.parseInt(request.getParameter("offseason")));
        
			
            RoomDAO roomdao=new RoomDAO();
			RoomDTO roomdto=new RoomDTO();
			
			roomdto.setRoom_num(room_num);
			roomdto.setRoom_type(room_type);
			roomdto.setRoom_grade(room_grade);
			roomdto.setRoom_price(room_price);
			roomdto.setRoom_person(room_person);
			roomdto.setPeakseason(peakseason);
			roomdto.setOffseason(offseason);
			System.out.println("roomdto=>"+roomdto);
			
			
		 
			roomdao.insert(roomdto);
//		 request.setAttribute("peakseason", peakseason);
//		 request.setAttribute("offseason", offseason);
		 
		return "/index.jsp";
	}
}
