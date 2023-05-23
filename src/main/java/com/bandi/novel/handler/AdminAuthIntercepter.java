package com.bandi.novel.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.bandi.novel.handler.exception.UnAuthorizedException;
import com.bandi.novel.model.User;
import com.bandi.novel.utils.Define;

/**
 * 로그인 되어있는지 세션 검사하는 intercepter
 * @author 김지현
 */
@Component
public class AdminAuthIntercepter implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		if (!principal.getUserRole().equals("admin")) {
			throw new UnAuthorizedException("로그인이 필요한 서비스입니다.", HttpStatus.UNAUTHORIZED, "/main");
			// return false;
		}
		return true;
	}



}