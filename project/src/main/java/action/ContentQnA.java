package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberDTO;
import model.QnaDAO;
import model.QnaDTO;



public class ContentQnA implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int qna_num=Integer.parseInt(request.getParameter("qna_num"));//게시물번호
		String pageNum=request.getParameter("pageNum");//페이지번호
		System.out.println
		("contentAction의 pageNum->"+pageNum+",qna_num=>"+qna_num);
		
		boolean contentCheck=false;
		
		QnaDAO dao=new QnaDAO();
		MemberDAO memdao=new MemberDAO();
		
		QnaDTO article=dao.getArticle(qna_num);//Null
		String mem_id=article.getMem_id();
		MemberDTO memdto=memdao.getPerson(mem_id);
		if(memdto.getMem_grade().equals("관리자")) {
			contentCheck=true;
		}
		//링크문자열의 길이를 줄이기위해서
		int qna_ref=article.getQna_ref();
		int qna_re_step=article.getQna_re_step();
		int qna_re_level=article.getQna_re_level();
		int qna_readcount=article.getQna_readcount();
		System.out.println("QnaContent.do의 매개변수 확인용");
		System.out.println("qna_ref="+qna_ref+",qna_re_step="+qna_re_step+",qna_re_level="+qna_re_level);
		System.out.println("qna_readcount=>"+qna_readcount);
				
		//2.실행결과 서버에 저장
		request.setAttribute("qna_num",qna_num);//${키명}
		request.setAttribute("pageNum",pageNum);
		request.setAttribute("article",article);//${artucle.ref}~
		request.setAttribute("contentCheck",contentCheck);
		
		System.out.println("contentCheck=>"+contentCheck);
		//${ref}
		//3.페이지 공유
		return "/QnaContent.jsp";
	}

}
