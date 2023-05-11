package com.bandi.novel.config;

import org.springframework.context.annotation.Configuration;


/**
 * 권한 부여 페이지 설정 /auth/**
 * 
 * @author GGG
 *
 */
@Configuration // IOC 등록
// @EnableWebSecurity // 시큐리티 필터로 등록
// @EnableGlobalMethodSecurity(prePostEnabled = true) // 특정 주소로 접근하면 권한 및 인증 처리 미리 하겠다.
public class SecurityConfig {

//	@Autowired
//	private PrincipalDetailService principalDetailService;

//	@Bean
//	public BCryptPasswordEncoder encodePwd() {
//		return new BCryptPasswordEncoder();
//	}

//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		http.csrf().disable(); // csrf 토큰 비활성화 처리(테스트시 사용 권장)
//
//		http.authorizeHttpRequests().antMatchers("/index", "/", "/js/**", "/css/**", "/images/**").permitAll()
//				.anyRequest().authenticated().and().formLogin().loginPage("/auth/login").loginProcessingUrl("/auth/loginProc").defaultSuccessUrl("/");
//	}
//
//	@Override
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		auth.userDetailsService(principalDetailService).passwordEncoder(encodePwd());
//	}

}
