package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.response.ContestDto;
import com.bandi.novel.model.Contest;

/**
 * 
 * @author 김경은
 */
@Mapper
public interface ContestRepository {
	
	int insertContest(Contest contest);
	int deleteContestById(Integer contestId);
	int updateContestByModel(Contest contest);
	
	Contest selectContestById(Integer id);
	Contest selectContestByUserIdAndTitle(Contest contest);
	
	List<Contest> selectContestListByDate();
	// 공모전 리스트에 사용
	List<ContestDto> selectContestList();
}
