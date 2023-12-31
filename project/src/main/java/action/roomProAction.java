package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RoomDAO;
import model.RoomDTO;

// /writePro.do
public class roomProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//이거 추가하고 수정 가능해짐
		     request.setCharacterEncoding("utf-8");
		    
		     RoomDTO room=new RoomDTO();
		     room.setRoom_type(request.getParameter("room_type"));
		     room.setPeakseason(Integer.parseInt(request.getParameter("peakseason")));
		     System.out.println(Integer.parseInt(request.getParameter("peakseason")));
		     room.setOffseason(Integer.parseInt(request.getParameter("offseason")));
		     System.out.println(Integer.parseInt(request.getParameter("offseason")));
		    
		     //room.setOffseason(Integer.parseInt(request.getParameter("offseason")));
		     
		    RoomDAO dbPro=new RoomDAO();
		    int check=dbPro.update(room);
		    System.out.println("check=>"+check);
		   
		    request.setAttribute("check", check);//데이터 수정성공유무
		   
		return "/roomPro.jsp";
	}
}
