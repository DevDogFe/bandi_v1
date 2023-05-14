package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.Genre;

@Mapper
public interface GenreRepository {

	List<Genre> selectAll();
}
