package com.bandi.novel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bandi.novel.dto.QuestionUpdateDto;
import com.bandi.novel.model.Answer;
import com.bandi.novel.model.FaqCategory;
import com.bandi.novel.model.Question;
import com.bandi.novel.model.User;
import com.bandi.novel.service.FaqService;
import com.bandi.novel.service.QnaService;

/**
 * QnaController
 * @author 효린
 */

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	@Autowired
	private FaqService faqService;

	/**
	 * 마이페이지
	 * @param model
	 * @return 1:1 문의 조회
	 */
	@GetMapping("/list")
	public String list(Model model) {

		// List<Question> questionList = qnaService.readQuestionByUserId(principal.getId);
		List<Question> questionList = qnaService.readQuestionByUserId(1);
		model.addAttribute("questionList", questionList);		

		return "/cs/qnaList";
	}

	/**
	 * @param model
	 * @return 1:1 문의 작성 폼
	 */
	@GetMapping("/write")
	public String getWrite(Model model) {

		// session
		List<FaqCategory> faqCategorylist = faqService.readFaqCategory();
		model.addAttribute("faqCategorylist", faqCategorylist);

		return "/cs/questionForm";
	}

	@PostMapping("/write")
	public String writeProc(Question question) {

		// session
		// 유효성
		// qnaService.createQuestion(question, principal.getId);
		qnaService.createQuestion(question, 1);

		return "redirect:/qna/list";
	}

	/**
	 * @param id
	 * @param model
	 * @return 질문상세보기
	 */
	@GetMapping("/question/{id}")
	public String getQuestion(@PathVariable Integer id, Model model) {

		Question question = qnaService.readQuestionById(id);
		model.addAttribute("question", question);

		return "/cs/questionDetail";
	}

	/**
	 * @param id
	 * @param model
	 * @return 질문수정 폼
	 */
	@GetMapping("/question/update/{id}")
	public String getupdateQuestion(@PathVariable Integer id, Model model) {

		Question question = qnaService.readQuestionById(id);
		List<FaqCategory> faqCategorylist = faqService.readFaqCategory();
		model.addAttribute("question", question);
		model.addAttribute("faqCategorylist", faqCategorylist);
		return "/cs/questionupdateForm";
	}

	/**
	 * 질문 수정
	 * @param questionUpdateFormDto
	 * @return Q&A 리스트
	 */
	@PostMapping("/question/update/{id}")
	public String updateQuestionProc(@PathVariable Integer id, QuestionUpdateDto questionUpdateDto) {

		// qnaService.updateQuestion(questionUpdateFormDto, principal.getId);
		qnaService.updateQuestion(questionUpdateDto, 1);

		return "redirect:/qna/question/" + id;
	}

	@GetMapping("/question/delete/{id}")
	public String deleteQuestion(@PathVariable Integer id) {

		// session
		qnaService.deleteQuestion(id);

		return "redirect:/qna/list";
	}

}
