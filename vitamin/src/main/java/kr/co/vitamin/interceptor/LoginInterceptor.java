package kr.co.vitamin.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.co.vitamin.repository.vo.AutoSignin;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.service.AccountService;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Inject
	private AccountService accountService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		Account accountVO = (Account)session.getAttribute("user");
		System.out.println(accountVO);
		if(accountVO != null) {
			if(accountVO.getEmailTokenStatus() == 2) {
				return true;
			}
		}
		
		Cookie cookie = WebUtils.getCookie(request, "AUTO_SIGNIN");
		if(cookie != null) {
			AutoSignin autoSignin = new AutoSignin();
			autoSignin.setAuthToken(cookie.getValue());

			Account accountVO2 = accountService.getAutoSigninToToken(autoSignin);
			System.out.println(accountVO2);
			if(accountVO2 != null) {
				session.setAttribute("user", accountVO2);
				return true;
			}
		}
		response.sendRedirect(request.getContextPath() + "/account/signinForm.do");
		return false;
	}
}