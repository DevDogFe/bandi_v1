package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.response.NovelReplyListDto;
import com.bandi.novel.model.NovelReply;

@Mapper
public interface NovelReplyRepository {

	int insert(NovelReply novelReply);
	
	List<NovelReplyListDto> selectBySectionId(Integer id);
}
