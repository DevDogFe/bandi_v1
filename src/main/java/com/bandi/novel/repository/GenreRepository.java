package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.Genre;

@Mapper
public interface GenreRepository {

	List<Genre> selectAll();
	// 장르 등록 
	Integer insert(Genre genre);
	// 장르 삭제 
	Integer deleteById(Integer id);
}
