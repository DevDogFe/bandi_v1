package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
	
	// 업데이트시 닉네임 중복확인, 자기자신 닉네임 제외
	public User selectByNickNameAndId(@Param("nickName") String nickName, @Param("id") Integer id);

	// 비밀번호 변경 (효린)
	public int updatePwd(User user);

}
