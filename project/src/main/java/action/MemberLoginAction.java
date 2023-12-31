package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LoginDAO;

public class MemberLoginAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		LoginDAO logDao =new LoginDAO();
		String mem_id=request.getParameter("mem_id");
		String mem_pw=request.getParameter("mem_pw");
		boolean check=logDao.loginCheck(mem_id,mem_pw);
		System.out.println("loginaction의 mem_id=>"+mem_id);
		System.out.println("loginaction의 mem_pw=>"+mem_pw);

		System.out.println("로그인 성공 여부 check=>"+check);
		
		request.getSession().setAttribute("idKey",mem_id);
		request.setAttribute("logcheck", check);
		if(check) {
			if(mem_pw.length()<8) {
				return "/warningpw.jsp";
			}else {
				String referer=(String)request.getSession().getAttribute("referer");
				System.out.println("referer=>"+referer);
			return "/index.do";
			}
		}else {
			request.getSession().setAttribute("idKey",null);
			return "/login.jsp?error";
		}
		
		}
	}
