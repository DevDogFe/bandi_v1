package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.response.NovelReplyListDto;
import com.bandi.novel.model.NovelReply;
import com.bandi.novel.repository.NovelReplyRepository;

/**
 * 소설 댓글 서비스
 * @author 김지현
 *
 */
@Service
public class NovelReplyService {

	@Autowired
	private NovelReplyRepository novelReplyRepository;
	
	// 댓글 등록
	@Transactional
	public void insertNovelReply(NovelReply novelReply) {
		
		int result = novelReplyRepository.insert(novelReply);
		// todo 예외처리
	}
	
	// 댓글 불러오기
	@Transactional
	public List<NovelReplyListDto> selectNovelReplyListBySectionId(Integer id){
		List<NovelReplyListDto> replyList = novelReplyRepository.selectBySectionId(id);
		
		return replyList;
	}
	
	// 댓글 삭제
	@Transactional
	public void deleteNovelReplyById(Integer id) {
		int result = novelReplyRepository.deleteById(id);
		// todo 예외처리
	}
	
}
