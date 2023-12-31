package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewDAO;
import model.ReviewDTO;

public class ReviewUpdateForm implements CommandAction {
	

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		String pageNum = request.getParameter("pageNum");
		System.out.println("ReviewUpdateForm의 review_num=>"+review_num+", pageNum=>"+pageNum);
		
		ReviewDAO dbPro = new ReviewDAO(); //메서드 호출목적
		ReviewDTO article = dbPro.updateGetArticle(review_num);//조회수 증가x
		
		//2.서버의 메모리에 저장(공유)
		request.setAttribute("review_num", review_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("article", article);
		
		return "/ReviewUpdate.jsp";
	}

}
