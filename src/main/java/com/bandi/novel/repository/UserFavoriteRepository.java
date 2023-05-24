package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.UserFavorite;

@Mapper
public interface UserFavoriteRepository {

	int insert(UserFavorite userFavorite);
	
	UserFavorite selectByUserIdAndNovelId(UserFavorite userFavorite);
	
	int delete(UserFavorite userFavorite);
	
	Integer selectUserFavoriteSumByNovelId(Integer novelId);
}
