package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewDAO;
import model.ReviewDTO;

public class ReviewUpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");//한글처리
		ReviewDTO article=new ReviewDTO();
		String pageNum=request.getParameter("pageNum");
		int review_num=(Integer.parseInt(request.getParameter("review_num")));
		System.out.println("UpdateProReview에서의 pageNum=>"+pageNum+"review_num=>"+review_num);
		article.setReview_num(review_num);
		article.setReview_subject(request.getParameter("review_subject"));
		article.setReview_content(request.getParameter("review_content"));
		article.setRoom_type(request.getParameter("room_type"));
		String idKey=(String)request.getSession().getAttribute("idKey");
		System.out.println("UpdateProReview의 idKey=>"+idKey);
		
		ReviewDAO dao=new ReviewDAO();
		dao.updateArticle(article,idKey);
		int check;
		if(idKey.equals(dao.ReveiwId(review_num))) {
			check=1;
		}else{
			check=0;
		}
		
		request.setAttribute("pageNum", pageNum);//수정 페이지로 이동
		request.setAttribute("check", check);//데이터 수정성공 유무
		
		return "/ReviewUpdatePro.jsp";
	}

}
