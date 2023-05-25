package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bandi.novel.model.UserLibrary;

@Mapper
public interface UserLibraryRepository {
	
	UserLibrary selectUserLibrary(@Param("userId")Integer userId,
			@Param("sectionId")Integer sectionId);
	
	int insertUserLibrary(UserLibrary userLibrary);
}
