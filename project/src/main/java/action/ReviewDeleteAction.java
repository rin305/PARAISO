package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewDAO;

public class ReviewDeleteAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		String pageNum = request.getParameter("pageNum");
		System.out.println("deleteForm.do의 num=>" + review_num + ", pageNum=>" + pageNum);

		request.setAttribute("review_num", review_num); // ${num}
		request.setAttribute("pageNum", pageNum);

		request.setCharacterEncoding("UTF-8");

		String mem_id = (String) request.getSession().getAttribute("idKey");
		System.out.println("DeleteFormQna의 id=>" + mem_id);

		ReviewDAO dao = new ReviewDAO();
		int check = dao.deleteArticle(review_num, mem_id);
		System.out.println("DeleteFormQna의 check=>" + check);
		if (mem_id != null) {
				request.setAttribute("review_num", review_num); // ${num}
				request.setAttribute("pageNum", pageNum);
			return "/ReviewList2.jsp";
		} else {
			request.setAttribute("review_num", review_num); // ${num}
				request.setAttribute("pageNum", pageNum);
			request.getSession().setAttribute("idKey", mem_id);
			return "/memberDelete.jsp?error";
		}
	}
}
