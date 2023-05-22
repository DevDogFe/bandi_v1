package com.bandi.novel.handler;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bandi.novel.handler.exception.CustomPageException;

/**
 * 페이지 예외 핸들러 
 * @author 김지현
 */
@ControllerAdvice
public class MyPageExceptionHandler implements ErrorController{
	
	
	
	// 사용자 정의 클래스 활용
	@ExceptionHandler(CustomPageException.class)
	public ModelAndView handleRuntimePageException(CustomPageException e) {
		System.out.println("dfdf~~");
		// ModelAndView 활용 방법
		ModelAndView modelAndView = new ModelAndView("/error/errorPage");
		modelAndView.addObject("statusCode", HttpStatus.NOT_FOUND.value());
		modelAndView.addObject("message", e.getMessage());
		return modelAndView;
	}
	
	
	
	
//	@ExceptionHandler(NoHandlerFoundException.class)
//	public String notFoundException(NoHandlerFoundException e) {
//		StringBuffer sb = new StringBuffer();
//		e.getMessage();
//		sb.append("<script>");
//		sb.append("location.href='/error/';");
//		sb.append("</script>");
//		return sb.toString();
//	}
	
	
//	/**
//	 * 마이바티스 제약 오류
//	 * @param e
//	 * @return 에러페이지
//	 */
//	@ExceptionHandler(DataIntegrityViolationException.class)
//	public ModelAndView dataIntegrityViolationException(DataIntegrityViolationException e) {
//		ModelAndView modelAndView = new ModelAndView("errorPage");
//		modelAndView.addObject("statusCode", HttpStatus.NOT_FOUND.value());
//		modelAndView.addObject("message", e.getMessage());
//		return modelAndView;
//	}
	
	
	
	
}
