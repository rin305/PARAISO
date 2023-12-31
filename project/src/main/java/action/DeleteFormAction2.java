package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteFormAction2 implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		 //deleteForm.jsp?num=2&pageNum=1->deletePro.jsp(deleteArticle)
		int num=Integer.parseInt(request.getParameter("notice_num"));//게시물번호
		String pageNum=request.getParameter("pageNum");//페이지 번호
	    System.out.println("deleteForm.do의 notice_num=>"+num+",pageNum=>"+pageNum);
	    
	    request.setAttribute("notice_num", num);
	    request.setAttribute("pageNum", pageNum);
		
		return "/deleteForm.jsp";  //"/notice/deleteForm.jsp
	}

}
