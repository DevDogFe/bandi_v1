package com.bandi.novel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.model.Question;
import com.bandi.novel.service.AdminService;
import com.bandi.novel.utils.Define;

/**
 * Q&A 컨트롤러
 * 
 * @author 효린
 */

@RestController
public class QnaApiController {

	@Autowired
	private AdminService adminService;
	/**
	 * 비동기 통신 처리
	 * 
	 * @return 질문 리스트 (전체)조회
	 */
	@GetMapping("/api/qnaList")
	public ResponseDto<List<Question>> list(String proceed) {
		
		List<Question> questionList = null;
		if (proceed.equals("-1") || proceed.equals("")) {
			questionList = adminService.selectAllQuestionList();
		} else {
			// 데이터 타입 변경
			questionList = adminService.selectIncompleteQuestionList(Integer.parseInt(proceed));
		}
		return new ResponseDto<List<Question>>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, questionList);
	}

}
