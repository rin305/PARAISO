package action;

import java.sql.Timestamp;//추가할 부분(시간)

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Helper;
import model.ReviewDAO;
import model.ReviewDTO;

// /writePro.do
public class ReviewWriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//한글처리
		     request.setCharacterEncoding("utf-8");
		     String idKey=(String)request.getSession().getAttribute("idKey");
		     Helper helper=new Helper();
		     String review_id=helper.getProtectedId(idKey);
				
				System.out.println("review_id=>"+review_id);
		     ReviewDTO article=new ReviewDTO();
		     System.out.println("review_num=>"+Integer.parseInt(request.getParameter("review_num"))+
		    		 "review_subject=>"+request.getParameter("review_subject")
		     +"review_ref=>"+Integer.parseInt(request.getParameter("review_ref")));
		     
		     //article.setNotice_num(Integer.parseInt(request.getParameter("notice_num")));
		     article.setReview_num(Integer.parseInt(request.getParameter("review_num")));//hidden
		     article.setMem_id(idKey);
		     article.setReview_subject(request.getParameter("review_subject"));
		    article.setReview_date(new Timestamp(System.currentTimeMillis()));//오늘 날짜 수동저장
		     article.setReview_content(request.getParameter("review_content"));//글내용
		    article.setRoom_type(request.getParameter("room_type"));
		    article.setReview_ref(Integer.parseInt(request.getParameter("review_ref")));
			article.setReview_re_step(Integer.parseInt(request.getParameter("review_re_step")));
			article.setReview_re_level(Integer.parseInt(request.getParameter("review_re_level")));
			
		    ReviewDAO dbPro=new ReviewDAO();
		    dbPro.insertArticle(article);
		   System.out.println("writeProAction()=>idKey"+idKey);
		   request.setAttribute("idKey", idKey);
		   request.setAttribute("review_id", review_id);
		    //response.sendRedirect("http://localhost:8090/JspBoard2/list.do"); 반환값이 없다면
		return "/ReviewwritePro.jsp";
	}
}
