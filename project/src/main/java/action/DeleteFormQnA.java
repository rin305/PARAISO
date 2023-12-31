package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.QnaDAO;

public class DeleteFormQnA implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		String pageNum = request.getParameter("pageNum");
		System.out.println("deleteForm.do의 num=>" + qna_num + ", pageNum=>" + pageNum);

		request.setAttribute("qna_num", qna_num); // ${num}
		request.setAttribute("pageNum", pageNum);

		request.setCharacterEncoding("UTF-8");

		String mem_id = (String) request.getSession().getAttribute("idKey");
		System.out.println("DeleteFormQna의 id=>" + mem_id);

		QnaDAO dao = new QnaDAO();
		int check = dao.deleteArticle(qna_num, mem_id);
		System.out.println("DeleteFormQna의 check=>" + check);
		if (mem_id != null) {
				request.setAttribute("qna_num", qna_num); // ${num}
				request.setAttribute("pageNum", pageNum);
			return "/QnaList.do";
		} else {
			request.setAttribute("qna_num", qna_num); // ${num}
				request.setAttribute("pageNum", pageNum);
			request.getSession().setAttribute("idKey", mem_id);
			return "/memberDelete.jsp?error";
		}
	}
}
