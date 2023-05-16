package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bandi.novel.dto.QnaDto;
import com.bandi.novel.model.Question;
import com.bandi.novel.repository.QnaRepository;

@Service
public class QnaService {
	
	@Autowired
	private QnaRepository qnaRepository;
	
	/**
	 * @return Q&A 전체조회
	 */
	public  List<QnaDto> readAllQnaList(){
		
		List<QnaDto> list = qnaRepository.findAll();
		return list;
	}
	
	public void createQuestion() {
		
		Question question = new Question();
		question.getId();
		question.getUserId();
		question.getTitle();
		question.getContent();
		question.getCreatedAt();
		
	}
	
	

}
