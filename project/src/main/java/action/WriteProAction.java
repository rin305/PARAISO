package action;

import java.sql.Timestamp;//추가할 부분(시간)

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardDTO;

// /writePro.do
public class WriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//한글처리
		     request.setCharacterEncoding("utf-8");
		     BoardDTO article=new BoardDTO();
		     
		     //article.setNotice_num(Integer.parseInt(request.getParameter("notice_num")));
		     article.setAdmin_id("adminid");
		    article.setNotice_time(new Timestamp(System.currentTimeMillis()));//오늘 날짜 수동저장
		    article.setNotice_subject(request.getParameter("notice_subject"));
		     article.setNotice_content(request.getParameter("notice_content"));//글내용
		   
		    BoardDAO dbPro=new BoardDAO();
		    dbPro.insertArticle(article);
		   System.out.println("writeProAction()=>");
		    //response.sendRedirect("http://localhost:8090/JspBoard2/list.do"); 반환값이 없다면
		return "/writePro.jsp";
	}
}
