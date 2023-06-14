package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bandi.novel.dto.JoinDto;
import com.bandi.novel.dto.UserRoleDto;
import com.bandi.novel.dto.UserSearchDto;
import com.bandi.novel.dto.UserUpdateDto;
import com.bandi.novel.model.User;
import com.bandi.novel.model.UserRole;

@Mapper
public interface UserRepository {
	
	/**
	 * 
	 * @return 오늘 가입한 유저숫자
	 */
	public Integer selectTodayJoinUserCount();

	public User selectByUserId(Integer id);

	public User selectByUsername(String username);

	public int insertUser(JoinDto joinDto);

	public int updateUser(UserUpdateDto userUpdateDto);

	public User selectByEmail(String email);

	public User selectByNickName(String nickName);
	
	// 업데이트시 닉네임 중복확인, 자기자신 닉네임 제외
	public User selectByNickNameAndId(@Param("nickName") String nickName, @Param("id") Integer id);

	// 비밀번호 변경 (효린)
	public Integer updatePwd(User user);
	
	// 유저롤 변경
	public Integer updateUserRole(User user);

	// 유저 검색
	public List<UserRoleDto> searchUser(UserSearchDto userSearchDto);
	
	// 유저롤 리스트 
	public List<UserRole> selectUserRole();
	
}
