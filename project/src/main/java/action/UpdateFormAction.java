package action;

import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardDTO;

public class UpdateFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1.content.jsp->글수정버튼 클릭->updateForm.do?num=3&pageNum=1
		   int notice_num=Integer.parseInt(request.getParameter("notice_num"));//게시물번호
		   String pageNum=request.getParameter("pageNum");//페이지 번호
		   System.out.println("UpdateFormAction에서의 pageNum=>"+pageNum);//0
		   BoardDAO dbPro=new BoardDAO();//메서드 호출목적
		   BoardDTO article=dbPro.updateGetArticle( notice_num);//조회수가 증가X
		   
		  
		//2.서버의 메모리에 저장
		   
		  request.setAttribute("pageNum", pageNum);
		  request.setAttribute("article",article);
		
		return "/updateForm.jsp";
	}
}
