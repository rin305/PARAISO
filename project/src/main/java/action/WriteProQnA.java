package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.QnaDAO;
import model.QnaDTO;

public class WriteProQnA implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");// 한글처리
		QnaDTO article = new QnaDTO();

		article.setQna_num(Integer.parseInt(request.getParameter("qna_num")));// hidden
		String mem_id = (String) request.getSession().getAttribute("idKey");
		if (mem_id == null) {

			return "/loginAlert.jsp";
		} else {
			article.setMem_id(mem_id);
			article.setQna_writer(request.getParameter("qna_writer"));
			article.setQna_subject(request.getParameter("qna_subject"));
			article.setQna_content(request.getParameter("qna_content"));
			article.setQna_type(request.getParameter("qna_type"));
			article.setQna_ref(Integer.parseInt(request.getParameter("qna_ref")));
			article.setQna_re_step(Integer.parseInt(request.getParameter("qna_re_step")));
			article.setQna_re_level(Integer.parseInt(request.getParameter("qna_re_level")));

			QnaDAO dbPro = new QnaDAO();
			dbPro.insertArticle(article);
			// 3.공유해서 페이지 이동
			return "/QnaWritePro.jsp";// /list.do로 처리->/list.jsp
		}
	}

}
