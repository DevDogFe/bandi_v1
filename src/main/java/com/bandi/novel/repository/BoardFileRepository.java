package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface BoardFileRepository {
	
	// 파일 업로드
	int insertFile(@Param("boardId") Integer boardId, @Param("rawFileName") String rawFileName, @Param("encodedFileName") String encodedFileName);
}
