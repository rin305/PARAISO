package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.QnaDAO;
import model.QnaDTO;

public class UpdateFormQnA implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		String pageNum = request.getParameter("pageNum");
		System.out.println("UpdateFormQna의 qna_num=>"+qna_num+", pageNum=>"+pageNum);
		
		QnaDAO dbPro = new QnaDAO(); //메서드 호출목적
		QnaDTO article = dbPro.updateGetArticle(qna_num);//조회수 증가x
		
		//2.서버의 메모리에 저장(공유)
		request.setAttribute("qna_num", qna_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("article", article);
		
		return "/updateQnaForm.jsp";
	}

}
