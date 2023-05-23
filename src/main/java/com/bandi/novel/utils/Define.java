package com.bandi.novel.utils;

public class Define {
	
	public final static String PRINCIPAL = "principal";
	
	public final static int MAX_FILE_SIZE = 1024 * 1024 * 20;
	
	public final static String UPLOAD_DIRECTORY = "C:\\bandi\\upload";
	
	public final static String REQUEST_FAIL = "요청을 처리하지 못했습니다.";

	/**
	 * 로그인 해야 접속 가능한 페이지 목록
	 * 
	 * @author 김지현
	 */
	public final static String[] AUTH_PATHS = { "/novel/**", "/section/**"};
	public final static String[] ADMIN_PATHS = {};
	public final static String[] AUTHOR_PATHS = {};

	
}
