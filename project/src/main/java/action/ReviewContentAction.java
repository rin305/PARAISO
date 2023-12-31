package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberDTO;
import model.ReviewDAO;
import model.ReviewDTO;



public class ReviewContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int review_num=Integer.parseInt(request.getParameter("review_num"));//게시물번호
		String pageNum=request.getParameter("pageNum");//페이지번호
		System.out.println
		("contentAction의 pageNum->"+pageNum+",qna_num=>"+review_num);
		
		boolean contentCheck=false;
		
		ReviewDAO dao=new ReviewDAO();
		MemberDAO memdao=new MemberDAO();
		
		ReviewDTO article=dao.getArticle(review_num);//Null
		String mem_id=article.getMem_id();
		MemberDTO memdto=memdao.getPerson(mem_id);
		if(memdto.getMem_grade().equals("관리자")) {
			contentCheck=true;
		}
		//링크문자열의 길이를 줄이기위해서
		int review_ref=article.getReview_ref();
		int review_re_step=article.getReview_re_step();
		int review_re_level=article.getReview_re_level();
		
		System.out.println("ReviewContent.do의 매개변수 확인용");
		System.out.println("review_ref="+review_ref+",review_re_step="+review_re_step+",review_re_level="+review_re_level);
	
				
		//2.실행결과 서버에 저장
		request.setAttribute("review_num",review_num);//${키명}
		request.setAttribute("pageNum",pageNum);
		request.setAttribute("article",article);//${artucle.ref}~
		request.setAttribute("contentCheck",contentCheck);
		System.out.println("article=>"+article);
		
		System.out.println("contentCheck=>"+contentCheck);
		//${ref}
		//3.페이지 공유
		return "/ReviewContent.jsp";
	}

}
