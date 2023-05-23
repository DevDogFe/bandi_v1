package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.UserUpdateDto;
import com.bandi.novel.model.User;

@Mapper
public interface UserRepository {

	public User selectByUserId(Integer id);
	
	public User selectByUsername(String username);
	
	public int insertUser(User user);
	
	public int updateUser(UserUpdateDto userUpdateDto);
	
	// 비밀번호 변경 (효린) 
	public int updatePwd(User user);
	
}
