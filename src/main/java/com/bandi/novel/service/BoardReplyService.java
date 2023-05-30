package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.BoardReplyDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.BoardReply;
import com.bandi.novel.repository.BoardReplyRepository;
import com.bandi.novel.utils.Define;

@Service
public class BoardReplyService {
	
	@Autowired
	private BoardReplyRepository boardReplyRepository;
	
	// 댓글 추가 
	@Transactional
	public void insertBoardReply(BoardReply boardReply) {
		int result = boardReplyRepository.insert(boardReply);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// 댓글 보기 
	@Transactional
	public List<BoardReplyDto> selectBoardReplyListByBoardId(Integer id) {
		List<BoardReplyDto> replyList = boardReplyRepository.selectByBoardId(id);
		return replyList;
	}
	
	// 댓글 삭제  
	@Transactional
	public Integer deleteBoardReplyById(Integer id) {
		int result = boardReplyRepository.deleteById(id);
		return result;
	}
}
