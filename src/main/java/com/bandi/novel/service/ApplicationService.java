package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.bandi.novel.dto.ApplicationFromDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.Application;
import com.bandi.novel.repository.ApplicationRepository;
import com.bandi.novel.utils.Define;

@Service
public class ApplicationService {
	
	@Autowired
	private ApplicationRepository applicationRepository;
	
	/**
	 * @return 연재문의 글 전체조회(관리자)
	 */
	public List<Application> selectAllApplication(){
		
		List<Application> list = applicationRepository.selectAll();
		return list;	
	}
	
	/**
	 * @param principalId
	 * @return 유저별 문의글 조회(마이페이지)
	 */
	public List<Application> selectApplicationByUserId(Integer principalId){
		
		List<Application> list = applicationRepository.selectByUserId(principalId);
		return list;		
	}
	
	/**
	 * @param id
	 * @return 연재글 조회
	 */
	public Application selectApplicationById(Integer id) {
		
		Application applicationEntity = applicationRepository.selectById(id);
		return applicationEntity;
	}
	
	/**
	 * 연재문의 글생성
	 * @param application
	 * @param principalId
	 */
	public void insertApplication(ApplicationFromDto applicationFromDto) {		
		
		int result = applicationRepository.insertApplication(applicationFromDto);		
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * 연재문의 글 삭제
	 * @param id
	 */
	public void deleteApplication(Integer id) {
		
		int result = applicationRepository.deleteById(id);		
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}

}
