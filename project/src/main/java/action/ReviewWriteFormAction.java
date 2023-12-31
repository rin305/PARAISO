package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
public class ReviewWriteFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int review_num=0,review_ref=1,review_re_step=0,review_re_level=0;
		
		String idKey=(String)request.getSession().getAttribute("idKey");
			Helper helper=new Helper();
			//boolean admincheck=(boolean)request.getSession().getAttribute("admincheck");
			
			
			
		   //content.do에서 매개변수가 전달
		   if(request.getParameter("review_num")!=null){ //0은 아니고 ,음수X=>양수 1이상
			   review_num = Integer.parseInt(request.getParameter("review_num"));//"3"=>3
			   review_ref=Integer.parseInt(request.getParameter("review_ref"));
			   review_re_step=Integer.parseInt(request.getParameter("review_re_step"));
			   review_re_level=Integer.parseInt(request.getParameter("review_re_level"));
		     System.out.println("content.jsp에서 넘어온 매개변수확인");
		     System.out.println("qna_num=>"+review_num+",qna_ref="+review_ref+
		    		                     ",qna_re_step="+review_re_step+",qna_re_level="+review_re_level);
		   }
		   //실행결과->서버의 메모리에 저장->이동
		   request.setAttribute("review_num", review_num);
		   request.setAttribute("review_ref", review_ref);
		   request.setAttribute("review_re_step", review_re_step);
		   request.setAttribute("review_re_level", review_re_level);
		   request.setAttribute("idKey", idKey);
//		   request.setAttribute("review_id", review_id);
		   System.out.println("qna_num=>"+review_num+",qna_ref="+review_ref+
                   ",qna_re_step="+review_re_step+",qna_re_level="+review_re_level);
//		   
		   
		return "/ReviewwriteForm.jsp";
	}
}
