package com.bandi.novel.utils;

public class Define {
	
	public final static String PRINCIPAL = "principal";
	
	public final static int MAX_FILE_SIZE = 1024 * 1024 * 20;
	
	public final static String UPLOAD_DIRECTORY = "C:\\bandi\\upload";
	
	public final static String REQUEST_FAIL = "요청을 처리하지 못했습니다.";
	
	public final static String REQUEST_SUCCESS = "요청을 정상적으로 처리하였습니다.";
	
	public final static int SORT_FAVORITE = 0;
	public final static int SORT_SCORE = 1;
	public final static int TYPE_PAY = 1;
	public final static int TYPE_FREE = 2;
	public final static int TYPE_CONTEST = 3;

	/**
	 * 로그인 해야 접속 가능한 페이지 목록
	 * 
	 * @author 김지현
	 */
	public final static String[] AUTH_PATHS = { "/novel/**", "/section/**"};
	public final static String[] ADMIN_PATHS = {};
	public final static String[] AUTHOR_PATHS = {};

	
}
