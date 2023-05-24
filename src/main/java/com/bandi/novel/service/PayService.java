package com.bandi.novel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bandi.novel.model.UserGold;
import com.bandi.novel.model.UserLibrary;
import com.bandi.novel.repository.UserGoldRepository;
import com.bandi.novel.repository.UserLibraryRepository;

@Service
public class PayService {

	@Autowired
	private UserLibraryRepository userLibraryRepository;
	@Autowired
	private UserGoldRepository userGoldRepository;

	public void insertUserLibrary(Integer userId, Integer sectionId) {

		UserLibrary userLibrary = new UserLibrary();
		userLibrary.setUserId(userId);
		userLibrary.setSectionId(sectionId);

		userLibraryRepository.insertUserLibrary(userLibrary);
	}

	public UserLibrary selectUserLibrary(Integer userId, Integer sectionId) {

		UserLibrary userLibrary = userLibraryRepository.selectUserLibrary(userId, sectionId);

		return userLibrary;
	}

	public int selectUserGold(Integer userId) {

		UserGold userGold = userGoldRepository.selectUserGoldByUserId(userId);

		return userGold.getGold();
	}

	public void purchaseNovel(Integer userId, Integer amount) {

		// 유저 골드 정보
		UserGold userGold = userGoldRepository.selectUserGoldByUserId(userId);
		userGold.setGold(userGold.getGold() - amount);
		int result = userGoldRepository.updateUserGold(userGold);

		if (result != 1) {
			System.out.println("골드 변경 안됨");
		} else {
			System.out.println("구매 후 골드 :" + userGoldRepository.selectUserGoldByUserId(userId).getGold());
		}
	}
	
	public void chargeGold(Integer userId, Integer amount) {
		UserGold userGold = userGoldRepository.selectUserGoldByUserId(userId);
		userGold.setGold(userGold.getGold() + amount);
		int result = userGoldRepository.updateUserGold(userGold);

		if (result != 1) {
			System.out.println("골드 충전 안됨");
		} else {
			System.out.println("충전 후 골드 :" + userGoldRepository.selectUserGoldByUserId(userId).getGold());
		}
	}
}
