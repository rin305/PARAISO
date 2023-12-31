package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberDTO;

public class MemberUpdateAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");// 한글처리
		 	String mem_id = (String) request.getSession().getAttribute("idKey");

			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.getPerson(mem_id);// 아이디로 dto 구하기
			dto.setMem_name(request.getParameter("mem_name"));
	 		System.out.println("MemberUpdateAction의 mem_name값=>" + request.getParameter("mem_name"));
			dto.setMem_gender(request.getParameter("mem_gender"));
			dto.setMem_birth(request.getParameter("mem_birth"));
			dto.setMem_email(request.getParameter("mem_email"));
			dto.setMem_phone(request.getParameter("mem_phone"));
			dto.setMem_addr(request.getParameter("mem_addr"));
			dto.setMem_addr2(request.getParameter("mem_addr2"));
			dto.setMem_zip(request.getParameter("mem_zip"));

			boolean check = dao.MemberUpdate(dto);// 회원정보 수정 유무
			System.out.println("MemberUpdateAction의 check값=>" + check);
			if (check) {
				request.setAttribute("memdto", dto);// 수정된 dto 다시 보내기
				return "/mypage.jsp";
			} else {
				request.getSession().setAttribute("idKey", mem_id);
				return "/infoEdit.jsp?error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "/infoEdit.jsp?error";
		} 
	}

}
