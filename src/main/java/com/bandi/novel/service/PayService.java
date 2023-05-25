package com.bandi.novel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bandi.novel.dto.response.UserPurchaseRentalRecord;
import com.bandi.novel.model.UserGold;
import com.bandi.novel.model.UserGoldCharge;
import com.bandi.novel.model.UserLibrary;
import com.bandi.novel.model.UserPurchase;
import com.bandi.novel.model.UserRental;
import com.bandi.novel.repository.NovelSectionRepository;
import com.bandi.novel.repository.UserGoldChargeRepository;
import com.bandi.novel.repository.UserGoldRepository;
import com.bandi.novel.repository.UserLibraryRepository;
import com.bandi.novel.repository.UserPurchaseRepository;
import com.bandi.novel.repository.UserRentalRepository;

@Service
public class PayService {

	@Autowired
	private UserLibraryRepository userLibraryRepository;
	@Autowired
	private UserGoldRepository userGoldRepository;
	@Autowired
	private UserGoldChargeRepository userGoldChargeRepository;
	@Autowired
	private UserPurchaseRepository userPurchaseRepository;
	@Autowired
	private NovelSectionRepository novelSectionRepository;
	@Autowired
	private UserRentalRepository userRentalRepository;

	// todo 삭제
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
	//

	public int selectUserGold(Integer userId) {

		UserGold userGold = userGoldRepository.selectUserGoldByUserId(userId);

		return userGold.getGold();
	}

	public void purchaseNovel(Integer userId, Integer amount,Integer sectionId) {

		// 유저 골드 정보
		UserGold userGold = userGoldRepository.selectUserGoldByUserId(userId);
		userGold.setGold(userGold.getGold() - amount);
		int result = userGoldRepository.updateUserGold(userGold);
		
		// 유저 구매 기록(user_purchase_tb)
		UserPurchase userPurchase = new UserPurchase();
		userPurchase.setUserId(userId);
		userPurchase.setSectionId(sectionId);
		userPurchase.setPrice(amount);
		
		userPurchaseRepository.insertPuchaseRecord(userPurchase);
		//
	}
	
	public void rentalNovel(Integer userId, Integer amount,Integer sectionId) {

		// 유저 골드 정보
		UserGold userGold = userGoldRepository.selectUserGoldByUserId(userId);
		userGold.setGold(userGold.getGold() - amount);
		int result = userGoldRepository.updateUserGold(userGold);
		
		// 유저 대여 기록(user_rental_tb)
		UserRental userRental = new UserRental();
		userRental.setUserId(userId);
		userRental.setSectionId(sectionId);
		userRental.setPrice(amount);
		
		userRentalRepository.insertRentalRecord(userRental);
		//
	}
	
	/**
	 * 골드 충전
	 * @return 
	 */
	public void chargeGold(Integer userId, Integer amount) {
		UserGold userGold = userGoldRepository.selectUserGoldByUserId(userId);
		userGold.setGold(userGold.getGold() + amount);
		
		int result = userGoldRepository.updateUserGold(userGold);
		
		// 골드 충전 기록 하기(user_gold_tb)
		UserGoldCharge userGoldCharge = new UserGoldCharge();
		userGoldCharge.setUserId(userId);
		userGoldCharge.setPrice(amount);
		
		userGoldChargeRepository.insertGoldChargeRecord(userGoldCharge);
		//
	}
	
	/**
	 * 구매 대여 기록 리스트
	 * @return 
	 */
	public List<UserPurchaseRentalRecord> selectUserPaymentRecord(Integer userId,Integer novelId) {
		
		List<UserPurchaseRentalRecord> paymentList = novelSectionRepository.selectPurchaseRentalRecord(userId, novelId);
		
		return paymentList;
	}
	
	/**
	 * 구매 대여 기록 조회
	 * @return 
	 */
	public UserPurchaseRentalRecord selectUserPaymentRecordByIds(Integer userId,Integer novelId,Integer sectionId) {
		
		UserPurchaseRentalRecord payment = novelSectionRepository.selectPurchaseRentalRecordByIds(userId, novelId, sectionId);
		
		return payment;
	}
}
