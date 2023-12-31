package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Helper;
import model.MemberDAO;
import model.MemberDTO;

public class WriteFormQnA implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int qna_num = 0, qna_ref = 1, qna_re_step = 0, qna_re_level = 0;
		response.setContentType("text/html; charset=utf-8");
		String idKey = (String) request.getSession().getAttribute("idKey");
		System.out.println("WriteFormQna의 idKey=>" + idKey);

		if (idKey == null) {
			
			return "/loginAlert.jsp";
		} else {
			MemberDAO memdao = new MemberDAO();
			MemberDTO memdto = memdao.getPerson(idKey);
			Helper helper = new Helper();
			boolean admincheck = (boolean) request.getSession().getAttribute("admincheck");
			String qna_writer;
			if (admincheck) {
				qna_writer = "관리자";
			} else {
				String mem_name = memdto.getMem_name();
				qna_writer = helper.getProtectedName(mem_name);
			}

			System.out.println("admincheck=>" + admincheck);

			// content.do에서 매개변수가 전달
			if (request.getParameter("qna_num") != null) { // 0은 아니고 ,음수X=>양수 1이상
				qna_num = Integer.parseInt(request.getParameter("qna_num"));// "3"=>3
				qna_ref = Integer.parseInt(request.getParameter("qna_ref"));
				qna_re_step = Integer.parseInt(request.getParameter("qna_re_step"));
				qna_re_level = Integer.parseInt(request.getParameter("qna_re_level"));
				System.out.println("content.jsp에서 넘어온 매개변수확인");
				System.out.println("qna_num=>" + qna_num + ",qna_ref=" + qna_ref + ",qna_re_step=" + qna_re_step
						+ ",qna_re_level=" + qna_re_level);
			}

			// 실행결과->서버의 메모리에 저장->이동
			request.setAttribute("qna_num", qna_num);
			request.setAttribute("qna_ref", qna_ref);
			request.setAttribute("qna_re_step", qna_re_step);
			request.setAttribute("qna_re_level", qna_re_level);
			request.setAttribute("idKey", idKey);
			request.setAttribute("qna_writer", qna_writer);

			return "/QnaWriteForm.jsp";
		}
	}
}
