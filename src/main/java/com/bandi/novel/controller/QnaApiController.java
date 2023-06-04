package com.bandi.novel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.QnaSearchDto;
import com.bandi.novel.dto.QuestionUpdateDto;
import com.bandi.novel.dto.response.QnaDto;
import com.bandi.novel.model.Answer;
import com.bandi.novel.model.FaqCategory;
import com.bandi.novel.model.Question;
import com.bandi.novel.model.User;
import com.bandi.novel.service.AdminService;
import com.bandi.novel.service.FaqService;
import com.bandi.novel.service.QnaService;
import com.bandi.novel.utils.Define;
import com.bandi.novel.utils.QnaPageUtil;

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
	public List<Question> list(String proceed) {

		List<Question> questionList = null;
		if (proceed.equals("-1") || proceed.equals("")) {
			questionList = adminService.selectAllQuestionList();
		} else {
			// 데이터 타입 변경
			questionList = adminService.selectIncompleteQuestionList(Integer.parseInt(proceed));
		}
		return questionList;
	}

}
