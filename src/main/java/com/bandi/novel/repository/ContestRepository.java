package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.Contest;

/**
 * 
 * @author 김경은
 */
@Mapper
public interface ContestRepository {
	
	int insertContest(Contest contest);
	int deleteContestById(int id);
	int updateContestByModel(Contest contest);
	
	Contest selectContestByUserIdAndTitle(Contest contest);
	
	List<Contest> selectContestListByDate();
	List<Contest> selectContestList();
}
