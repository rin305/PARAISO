package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;

public class DeleteFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		 //deleteForm.jsp?num=2&pageNum=1->deletePro.jsp(deleteArticle)
		String pageNum=request.getParameter("pageNum");
	    //추가
	 
	   int num=Integer.parseInt(request.getParameter("notice_num"));
	    System.out.println("deletePro.do의 num=>"
	                +num+",pageNum=>"+pageNum);
	    
	    BoardDAO dbPro=new BoardDAO();
	    int check=dbPro.deleteArticle(num);
	    
	    //공유
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("check", check);
		
		return "/deletePro.jsp";
	}

}
