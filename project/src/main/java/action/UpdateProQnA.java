package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.QnaDAO;
import model.QnaDTO;

public class UpdateProQnA implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");//한글처리
		QnaDTO article=new QnaDTO();
		String pageNum=request.getParameter("pageNum");
		int qna_num=(Integer.parseInt(request.getParameter("qna_num")));
		System.out.println("UpdateProQna에서의 pageNum=>"+pageNum+"qna_num=>"+qna_num);
		article.setQna_num(qna_num);
		article.setQna_subject(request.getParameter("qna_subject"));
		article.setQna_content(request.getParameter("qna_content"));
		article.setQna_type(request.getParameter("qna_type"));
		String idKey=(String)request.getSession().getAttribute("idKey");
		System.out.println("UpdateProQnA의 idKey=>"+idKey);
		
		QnaDAO dao=new QnaDAO();
		dao.updateArticle(article,idKey);
		int check;
		if(idKey.equals(dao.QnaId(qna_num))) {
			check=1;
		}else{
			check=0;
		}
		
		request.setAttribute("pageNum", pageNum);//수정 페이지로 이동
		request.setAttribute("check", check);//데이터 수정성공 유무
		
		return "/updateQnaPro.jsp";
	}

}
