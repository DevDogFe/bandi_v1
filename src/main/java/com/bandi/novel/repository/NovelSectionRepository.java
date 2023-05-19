package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.NovelSection;
import com.mysql.cj.x.protobuf.MysqlxCrud.Insert;

@Mapper
public interface NovelSectionRepository {

	List<NovelSection> selectListByNovelId(Integer id);
	
	int insert(NovelSection novelSection);
	
	NovelSection selectById(Integer id);
	
	// 조회수 1 증가
	int updateViewsById(Integer sectionId);
	
}
