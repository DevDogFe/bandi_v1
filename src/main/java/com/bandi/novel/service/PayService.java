package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.response.PurchaseRecordDto;
import com.bandi.novel.dto.response.RentalRecordDto;
import com.bandi.novel.dto.response.UserPurchaseRentalRecord;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.Account;
import com.bandi.novel.model.UserGold;
import com.bandi.novel.model.UserGoldCharge;
import com.bandi.novel.model.UserLibrary;
import com.bandi.novel.model.UserPurchase;
import com.bandi.novel.model.UserRental;
import com.bandi.novel.repository.AccountRepository;
import com.bandi.novel.repository.NovelSectionRepository;
import com.bandi.novel.repository.UserGoldChargeRepository;
import com.bandi.novel.repository.UserGoldRepository;
import com.bandi.novel.repository.UserLibraryRepository;
import com.bandi.novel.repository.UserPurchaseRepository;
import com.bandi.novel.repository.UserRentalRepository;
import com.bandi.novel.utils.Define;

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
	@Autowired
	private AccountRepository accountRepository;

	// todo 삭제
	@Transactional
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

	/**
	 * 사용자 골드 조회
	 * @return 
	 */
	@Transactional
	public int selectUserGold(Integer userId) {

		UserGold userGold = userGoldRepository.selectUserGoldByUserId(userId);

		return userGold.getGold();
	}
	
	/**
	 * 사용자 골드 충전 기록 조회
	 * @return 
	 */
	@Transactional
	public List<UserGoldCharge> selectGoldCharge(Integer userId) {
		
		List<UserGoldCharge> userGoldCharge = userGoldChargeRepository.selectByUserId(userId);
		
		return userGoldCharge;
	}
	
	/**
	 * 소설 구매 기록 조회
	 * @return 
	 */
	@Transactional
	public List<PurchaseRecordDto> selectPurchaseRecord(Integer userId) {
		
		List<PurchaseRecordDto> userPurchaseRecord = userPurchaseRepository.selectByUserId(userId);
		
		return userPurchaseRecord;
	}
	
	/**
	 * 소설 대여 기록 조회
	 * @return 
	 */
	@Transactional
	public List<RentalRecordDto> selectRentalRecord(Integer userId) {
		
		List<RentalRecordDto> userRentalRecord = userRentalRepository.selectByUserId(userId);
		
		return userRentalRecord;
	}

	/**
	 * 소설 구매
	 * @return 
	 */
	@Transactional
	public void purchaseNovel(Integer userId, Integer amount,Integer sectionId) {

		// 유저 골드 정보
		UserGold userGold = userGoldRepository.selectUserGoldByUserId(userId);
		userGold.setGold(userGold.getGold() - amount);
		int result = userGoldRepository.updateUserGold(userGold);
		if(result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 유저 구매 기록(user_purchase_tb)
		UserPurchase userPurchase = new UserPurchase();
		userPurchase.setUserId(userId);
		userPurchase.setSectionId(sectionId);
		userPurchase.setPrice(amount);
		
		userPurchaseRepository.insertPuchaseRecord(userPurchase);
		//
	}
	
	/**
	 * 소설 결제 구매
	 * @return 
	 */
	@Transactional
	public void purchasePayNovel(Integer userId, Integer amount,Integer sectionId) {

		// 유저 구매 기록(user_purchase_tb)
		UserPurchase userPurchase = new UserPurchase();
		userPurchase.setUserId(userId);
		userPurchase.setSectionId(sectionId);
		userPurchase.setPrice(amount);
		
		userPurchaseRepository.insertPuchaseRecord(userPurchase);
		//
	}
	
	/**
	 * 소설 대여
	 * @return 
	 */
	@Transactional
	public void rentalNovel(Integer userId, Integer amount,Integer sectionId) {

		// 유저 골드 정보
		UserGold userGold = userGoldRepository.selectUserGoldByUserId(userId);
		userGold.setGold(userGold.getGold() - amount);
		int result = userGoldRepository.updateUserGold(userGold);
		if(result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 유저 대여 기록(user_rental_tb)
		UserRental userRental = new UserRental();
		userRental.setUserId(userId);
		userRental.setSectionId(sectionId);
		userRental.setPrice(amount);
		
		userRentalRepository.insertRentalRecord(userRental);
		//
	}
	
	/**
	 * 소설 결제 대여
	 * @return 
	 */
	@Transactional
	public void rentalPayNovel(Integer userId, Integer amount,Integer sectionId) {

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
	@Transactional
	public void chargeGold(Integer userId, Integer amount,String tid) {
		UserGold userGold = userGoldRepository.selectUserGoldByUserId(userId);
		userGold.setGold(userGold.getGold() + amount);
		
		int result = userGoldRepository.updateUserGold(userGold);
		if(result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 골드 충전 기록 하기(user_gold_tb)
		UserGoldCharge userGoldCharge = new UserGoldCharge();
		userGoldCharge.setUserId(userId);
		userGoldCharge.setPrice(amount);
		userGoldCharge.setTid(tid);
		
		userGoldChargeRepository.insertGoldChargeRecord(userGoldCharge);
		/**
		 * @author 김지현
		 * 골드 충전 매출에 합치기
		 */
		if(amount < 1000) {
			accountRepository.insertSalesHistory(Account.builder().sales(amount).memo(Define.BUY).build());
		} else {
			accountRepository.insertSalesHistory(Account.builder().sales(amount).memo(Define.BUY).build());
		}
	}
	
	/**
	 * 골드 환불
	 * @return 
	 */
	@Transactional
	public void RefundGold(Integer userId, Integer amount,Integer goldChargeId) {
		UserGold userGold = userGoldRepository.selectUserGoldByUserId(userId);
		userGold.setGold(userGold.getGold() - amount);
		
		int updateResult = userGoldRepository.updateUserGold(userGold);
		
		int deleteResult = userGoldChargeRepository.deleteGoldChargeRecordById(goldChargeId);
		accountRepository.insertRefundHistory(Account.builder().refund(amount).memo(Define.REFUND).build());
		
		if(updateResult != 1 || deleteResult != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * 구매 대여 기록 리스트
	 * @return 
	 */
	@Transactional
	public List<UserPurchaseRentalRecord> selectUserPaymentRecord(Integer userId,Integer novelId) {
		
		List<UserPurchaseRentalRecord> paymentList = novelSectionRepository.selectPurchaseRentalRecord(userId, novelId);
		
		return paymentList;
	}
	
	/**
	 * 구매 대여 기록 조회
	 * @return 
	 */
	@Transactional
	public UserPurchaseRentalRecord selectUserPaymentRecordByIds(Integer userId,Integer novelId,Integer sectionId) {
		
		UserPurchaseRentalRecord payment = novelSectionRepository.selectPurchaseRentalRecordByIds(userId, novelId, sectionId);
		
		return payment;
	}
}
