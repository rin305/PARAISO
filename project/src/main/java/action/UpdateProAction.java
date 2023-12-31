package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardDTO;

// /writePro.do
public class UpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//한글처리
		     request.setCharacterEncoding("utf-8");
		     //추가(수정된 게시물로 이동시키기위해서 필요)
		     String pageNum=request.getParameter("pageNum");
		     
		     System.out.println("UpdateProAction에서의 pageNum=>"+pageNum);//0
		     //--------------------------------------------------------
		     BoardDTO article=new BoardDTO();
		     
		     article.setNotice_num(Integer.parseInt(request.getParameter("notice_num")));
		     article.setAdmin_id(request.getParameter("admin_id"));
		     article.setNotice_time(new Timestamp(System.currentTimeMillis()));//오늘 날짜 수동저장
		    
		     article.setNotice_subject(request.getParameter("notice_subject"));
		     article.setNotice_content(request.getParameter("notice_content"));//글내용
		    
		     
		    BoardDAO dbPro=new BoardDAO();
		    int check=dbPro.updateArticle(article);
		   
		    //2개의 공유값이 필요
		    request.setAttribute("pageNum", pageNum);//수정할 페이지로 이동
		    request.setAttribute("check", check);//데이터 수정성공유무
		    
		return "/updatePro.jsp";
	}
}
