package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bandi.novel.dto.ApplicationFromDto;
import com.bandi.novel.model.Application;
import com.bandi.novel.repository.ApplicationRepository;

@Service
public class ApplicationService {
	
	@Autowired
	private ApplicationRepository applicationRepository;
	
	/**
	 * @return 연재문의 글 전체조회(관리자)
	 */
	public List<Application> readAllApplication(){
		
		List<Application> list = applicationRepository.findAll();
		return list;	
	}
	
	/**
	 * @param principalId
	 * @return 유저별 문의글 조회(마이페이지)
	 */
	public List<Application> readApplicationByUserId(Integer principalId){
		
		List<Application> list = applicationRepository.findByUserId(principalId);
		return list;		
	}
	
	/**
	 * @param id
	 * @return 연재글 조회
	 */
	public Application readApplicationById(Integer id) {
		
		Application applicationEntity = applicationRepository.findById(id);
		return applicationEntity;
	}
	
	/**
	 * 연재문의 글생성
	 * @param application
	 * @param principalId
	 */
	public void createApplication(ApplicationFromDto applicationFromDto) {		
		
		int resultRowCount = applicationRepository.insert(applicationFromDto);		
		if (resultRowCount != 1) {
			System.out.println("연재문의 작성 실패");
		}
	}
	
	/**
	 * 연재문의 글 삭제
	 * @param id
	 */
	public void deleteApplication(Integer id) {
		
		int resultRowCount = applicationRepository.deleteById(id);		
		if (resultRowCount != 1) {
			System.out.println("연재문의 삭제 실패");
		}
		
	}

}
