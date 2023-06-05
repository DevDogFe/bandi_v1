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

import com.bandi.novel.dto.QnaSearchDto;
import com.bandi.novel.dto.QuestionUpdateDto;
import com.bandi.novel.dto.response.QnaDto;
import com.bandi.novel.model.Answer;
import com.bandi.novel.model.FaqCategory;
import com.bandi.novel.model.Question;
import com.bandi.novel.model.User;
import com.bandi.novel.service.FaqService;
import com.bandi.novel.service.QnaService;
import com.bandi.novel.utils.Define;
import com.bandi.novel.utils.QnaPageUtil;

/**
 * Q&A 컨트롤러
 * 
 * @author 효린
 */

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	private HttpSession session;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private FaqService faqService;

	@GetMapping("/list")
	public String allList(Model model, @RequestParam(defaultValue = "1") Integer currentPage, QnaSearchDto qnaSearchDto) {
		
		List<QnaDto> qnaList = null;
		if (qnaSearchDto.getKeyword() == null) {
			qnaList = qnaService.selectAllQna();
		} else {
			qnaList = qnaService.readQnaListByKeyword(qnaSearchDto);
		}
		List<FaqCategory> faqCategorylist = faqService.selectFaqCategory();
		QnaPageUtil qnaPageUtil = new QnaPageUtil(qnaList.size(), 10, currentPage, 5, qnaList);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("faqCategorylist", faqCategorylist);
		model.addAttribute("qnaPageUtil", qnaPageUtil);
		return "/cs/qna";
	}

	/**
	 * 마이페이지
	 * 
	 * @param model
	 * @return 1:1 문의 조회
	 */
	@GetMapping("/myList")
	public String list(Model model) {

		// List<Question> questionList =
		// qnaService.readQuestionByUserId(principal.getId);
		List<Question> questionList = qnaService.selectQuestionByUserId(1);
		model.addAttribute("questionList", questionList);

		return "/cs/qnaList";
	}

	/**
	 * @param model
	 * @return 1:1 문의 작성 폼
	 */
	@GetMapping("/write")
	public String getWrite(Model model) {

		List<FaqCategory> faqCategorylist = faqService.selectFaqCategory();
		model.addAttribute("faqCategorylist", faqCategorylist);

		 return "/cs/questionWriteForm";
	}

	@PostMapping("/write")
	public String writeProc(Question question) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		// 유효성
		// qnaService.createQuestion(question, principal.getId);
		qnaService.selectQuestion(question, 1);

		return "redirect:/qna/list";
	}

	/**
	 * @param id
	 * @param model
	 * @return 질문상세보기
	 */
	@GetMapping("/question/{id}")
	public String getQuestion(@PathVariable Integer id, Model model) {

		Question question = qnaService.selectQuestionById(id);
		model.addAttribute("question", question);
		// model.addAttribute("principalId", 1);

		return "/cs/questionDetail";
	}

	/**
	 * @param id
	 * @param model
	 * @return 질문수정 폼
	 */
	@GetMapping("/question/update/{id}")
	public String getupdateQuestion(@PathVariable Integer id, Model model) {

		Question question = qnaService.selectQuestionById(id);
		List<FaqCategory> faqCategorylist = faqService.selectFaqCategory();
		model.addAttribute("question", question);
		model.addAttribute("faqCategorylist", faqCategorylist);
		return "/cs/questionupdateForm";
	}

	/**
	 * 질문 수정
	 * 
	 * @param questionUpdateFormDto
	 * @return Q&A 리스트
	 */
	@PostMapping("/question/update/{id}")
	public String updateQuestionProc(@PathVariable Integer id, QuestionUpdateDto questionUpdateDto) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		// qnaService.updateQuestion(questionUpdateFormDto, principal.getId);
		qnaService.updateQuestion(questionUpdateDto, 1);
		return "redirect:/qna/question/" + id;
	}

	/**
	 * 질문 삭제
	 * * @param id
	 * @return Q&A 전체조회(마이페이지)
	 */
	@GetMapping("/question/delete/{id}")
	public String deleteQuestion(@PathVariable Integer id) {

		qnaService.deleteQuestion(id);
		return "redirect:/qna/list";
	}

	/**
	 * @param questionId
	 * @param model
	 * @return 답변 상세
	 */
	@GetMapping("/answer/{questionId}")
	public String getAnswer(@PathVariable Integer questionId, Model model) {

		Question question = qnaService.selectQuestionById(questionId);
		Answer answer = qnaService.selectAnswerByQuestionId(questionId);
		model.addAttribute("question", question);
		model.addAttribute("answer", answer);

		return "/cs/answerDetail";

	}

}
