package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.BoardReplyDto;
import com.bandi.novel.model.BoardReply;

@Mapper
public interface BoardReplyRepository {
	
	// 댓글 등록 
	Integer insert(BoardReply boardReply);
	// 댓글 조회 
	List<BoardReplyDto> selectByBoardId(Integer id);
	// 댓글 삭제 
	Integer deleteById(Integer id);
}
