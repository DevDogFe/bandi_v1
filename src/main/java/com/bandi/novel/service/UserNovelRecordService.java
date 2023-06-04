package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.response.LastNovelRecordDto;
import com.bandi.novel.dto.response.NovleRecordSectionDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.UserNovelRecord;
import com.bandi.novel.repository.UserNovelRecordRepository;
import com.bandi.novel.utils.Define;

@Service
public class UserNovelRecordService {

	@Autowired
	private UserNovelRecordRepository userNovelRecordRepository;

	/**
	 * 본 소설 기록 기능
	 * @return 
	 */
	@Transactional
	public void NovelRecord(Integer userId,Integer novelId,Integer sectionId) {
		
		int result = 0;
		UserNovelRecord userNovelRecord = UserNovelRecord.builder()
														.userId(userId)
														.novelId(novelId)
														.sectionId(sectionId)
														.build();
		
		// 기록이 없는 경우 삽입, 있는 경우 업데이트
		if(userNovelRecordRepository.selectNovelRecordByModel(userNovelRecord) == null) {
			result = userNovelRecordRepository.insertNovelRecord(userNovelRecord);
		}else {
			result = userNovelRecordRepository.updateNovelRecord(userNovelRecord);
		}

		if (result < 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * 유저가 본 소설 조회
	 * @return LastNovelRecordDto
	 */
	@Transactional
	public List<NovleRecordSectionDto> selectNovelRecord(Integer userId,Integer novelId) {
		
		List<NovleRecordSectionDto> dto = userNovelRecordRepository.selectNovelRecord(userId,novelId);
		
		return dto;
	}

	/**
	 * 마지막으로 본 소설 조회
	 * @return LastNovelRecordDto
	 */
	@Transactional
	public LastNovelRecordDto selectLastNovelRecord(Integer userId) {
		
		LastNovelRecordDto dto = userNovelRecordRepository.selectLastNovelRecord(userId);
		
		return dto;
	}
	
}
