package com.bandi.novel.handler;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.bandi.novel.handler.exception.CustomPathException;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.handler.exception.UnAuthorizedException;

/**
 * restful 예외 핸들러
 * @author 김지현
 *
 */
@RestControllerAdvice 
public class RestFulExceptionHandler {

	@ExceptionHandler(Exception.class)
	public void exception(Exception e) {
		System.out.println(e.getClass().getName());
		System.out.println(e.getMessage());
	}
	
	@ExceptionHandler(CustomRestfulException.class)
	public String basicException(CustomRestfulException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+ e.getMessage() +"');"); 
		sb.append("history.back();");
		sb.append("</script>");
		return sb.toString();
	}
	
	@ExceptionHandler(UnAuthorizedException.class)
	public String unAuthorizedException(UnAuthorizedException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+ e.getMessage() +"');"); 
		sb.append("location.href='" + e.getPath() + "';");
		sb.append("</script>");
		return sb.toString();
	}
	
	@ExceptionHandler(CustomPathException.class)
	public String customPathException(CustomPathException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+ e.getMessage() +"');");
		sb.append("location.href='" + e.getPath() + "';");
		sb.append("</script>");
		return sb.toString();
	}

	
	
	
	
	
}
