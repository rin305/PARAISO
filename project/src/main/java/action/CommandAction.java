package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandAction {//ListAction,Write~

//이동할 페이지의 경로와 페이지명이 필요=>반환값(String)->스프링(ModelAndView)
	public String requestPro(HttpServletRequest request,
			                           HttpServletResponse response)
	                                  throws Throwable;
}
