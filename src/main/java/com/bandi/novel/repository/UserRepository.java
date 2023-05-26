package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.JoinDto;
import com.bandi.novel.dto.UserUpdateDto;
import com.bandi.novel.model.User;

@Mapper
public interface UserRepository {

	public User selectByUserId(Integer id);

	public User selectByUsername(String username);

	public int insertUser(JoinDto joinDto);

	public int updateUser(UserUpdateDto userUpdateDto);

	public User selectByEmail(String email);

	public User selectByNickName(String nickName);

	// 비밀번호 변경 (효린)
	public int updatePwd(User user);
	
	// 유저롤 변경
	public Integer updateUserRole(User user);

}
