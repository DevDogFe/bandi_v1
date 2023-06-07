package com.bandi.novel.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.bandi.novel.handler.AdminAuthIntercepter;
import com.bandi.novel.handler.AuthIntercepter;
import com.bandi.novel.handler.AuthorAuthIntercepter;
import com.bandi.novel.utils.Define;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Autowired
	private AuthIntercepter authIntercepter;
	@Autowired
	private AdminAuthIntercepter adminAuthIntercepter;
//	@Autowired
//	private AuthorAuthIntercepter authorAuthIntercepter;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// path 설정할 때 Define에서 맞는 곳에 추가할 것
		registry.addInterceptor(authIntercepter).addPathPatterns(Define.AUTH_PATHS);
		registry.addInterceptor(adminAuthIntercepter).addPathPatterns(Define.ADMIN_PATHS);
		// registry.addInterceptor(authorAuthIntercepter).addPathPatterns(Define.AUTHOR_PATHS);
		
	}

	// 파일 리소스 등록
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/bandi/uploads/**")
				.addResourceLocations("file:///C:\\bandi\\upload/");

	}

	/**
	 * 패스워드인코더 등록
	 * 
	 * @return BCryptPasswordEncoder
	 */
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
