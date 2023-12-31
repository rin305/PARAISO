package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

public class MemberJoinAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			request.setCharacterEncoding("UTF-8");
			
			MemberDTO memDto = new MemberDTO();
			memDto.setMem_id(request.getParameter("mem_id"));
			memDto.setMem_pw(request.getParameter("mem_pw"));
			memDto.setMem_gender(request.getParameter("mem_gender"));
			memDto.setMem_name(request.getParameter("mem_name"));
			memDto.setMem_birth(request.getParameter("mem_birth"));
			memDto.setMem_phone(request.getParameter("mem_phone"));
			memDto.setMem_addr(request.getParameter("mem_addr"));
			memDto.setMem_addr2(request.getParameter("mem_addr2"));
			memDto.setMem_zip(request.getParameter("mem_zip"));
			memDto.setMem_email(request.getParameter("mem_email"));
			
			MemberDAO memDao = new MemberDAO();
			memDao.memberInsert(memDto);
			//String mem_id=memDto.getMem_id();
			boolean success=memDao.getPerson(memDto.getMem_id()) != null;
			System.out.println("MemberJoinAction의 memberInsert 값=>"+success);
			
			
			return "/login.jsp";
		}
	}
