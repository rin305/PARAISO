package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// /writeForm.do
public class WriteFormAction implements CommandAction {

	  @Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		   //list.jsp(글쓰기)->신규글, content.jsp(글상세보기->글쓰기(답변글))
		  int num=0;
		   
		   //content.do에서 매개변수가 전달
		   if(request.getParameter("notice_num")!=null){ //0은 아니고 ,음수X=>양수 1이상
		    num=Integer.parseInt(request.getParameter("notice_num"));//"3"=>3
		     
		     System.out.println("content.jsp에서 넘어온 매개변수확인");
		     System.out.println("notice_num=>"+num);
		   }
		   //실행결과->서버의 메모리에 저장->이동
		   request.setAttribute("notice_num", num);
		   
		return "/writeForm.jsp";
	}
}
